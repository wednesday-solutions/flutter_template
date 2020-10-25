import 'dart:async';

import 'package:flutter_template_bloc/core/failures/city_failure.dart';
import 'package:flutter_template_bloc/data/datasource/local/dao/city_dao_interface.dart';
import 'package:flutter_template_bloc/data/datasource/network/weather_api_service_interface.dart';
import 'package:flutter_template_bloc/data/model/city.dart';
import 'package:flutter_template_bloc/data/model/weather.dart';
import 'package:flutter_template_bloc/core/failures/weather_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:flutter_template_bloc/data/repository/weather_repository_interface.dart';
import 'package:moor_flutter/moor_flutter.dart';

@LazySingleton(as: IWeatherRepository)
class WeatherRepository implements IWeatherRepository {
  final ICityDao cityDao;
  final IWeatherApiService weatherApiService;

  const WeatherRepository(this.cityDao, this.weatherApiService);

  @override
  Future<Either<WeatherFailure, KtList<Weather>>>
      getWeatherForAllCities() async {
    try {
      final List<City> cities = await cityDao.getAllCities();
      final List<Weather> weatherForCities = await Stream.fromIterable(cities)
          .asyncMap((city) => weatherApiService.weatherForCity(city.woeid))
          .toList();
      return right(weatherForCities.toImmutableList());
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.CONNECT_TIMEOUT:
        case DioErrorType.SEND_TIMEOUT:
        case DioErrorType.RECEIVE_TIMEOUT:
          return left(WeatherFailure.requestTimeOut(message: e.message));
          break;
        case DioErrorType.RESPONSE:
          return left(WeatherFailure.unableToFetch(message: e.message));
        case DioErrorType.CANCEL:
        case DioErrorType.DEFAULT:
        default:
          return left(WeatherFailure.unknown(message: e.message));
      }
    } on MoorWrappedException catch (e) {
      return left(WeatherFailure.unableToFetch(message: e.message));
    }
  }

  @override
  Stream<Either<WeatherFailure, KtList<Weather>>> watchWeatherForAllCities() {
    return cityDao.watchAllCities().asyncMap((citiesList) async {
      final List<Weather> weatherList = await Future.wait(citiesList.map(
        (city) async => weatherApiService.weatherForCity(city.woeid),
      ));
      return right<WeatherFailure, KtList<Weather>>(
          weatherList.toImmutableList());
    }).onErrorReturnWith((e) {
      if (e is DioError) {
        switch (e.type) {
          case DioErrorType.CONNECT_TIMEOUT:
          case DioErrorType.SEND_TIMEOUT:
          case DioErrorType.RECEIVE_TIMEOUT:
            return left(WeatherFailure.requestTimeOut(message: e.message));
            break;
          case DioErrorType.RESPONSE:
            return left(WeatherFailure.unableToFetch(message: e.message));
          case DioErrorType.CANCEL:
          case DioErrorType.DEFAULT:
          default:
            return left(WeatherFailure.unknown(message: e.message));
        }
      } else {
        return left(WeatherFailure.unknown(message: e.message.toString()));
      }
    });
  }

  @override
  Future<Either<CityFailure, KtList<City>>> searchCities(
      {String searchTerm}) async {
    try {
      final List<City> citiesList =
          await weatherApiService.searchCities(searchTerm);

      if (citiesList.isNotEmpty) {
        return right(citiesList.toImmutableList());
      } else {
        return left(const CityFailure.noMatchingResults());
      }
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.CONNECT_TIMEOUT:
        case DioErrorType.SEND_TIMEOUT:
        case DioErrorType.RECEIVE_TIMEOUT:
          return left(CityFailure.requestTimeOut(message: e.message));
          break;
        case DioErrorType.RESPONSE:
          return left(CityFailure.unableToFetch(message: e.message));
        case DioErrorType.CANCEL:
        case DioErrorType.DEFAULT:
        default:
          return left(CityFailure.unknown(message: e.message));
      }
    } on MoorWrappedException catch (e) {
      return left(CityFailure.unknown(message: e.message));
    } on InvalidDataException catch (e) {
      return left(CityFailure.invalidData(message: e.message));
    }
  }

  @override
  Stream<Either<CityFailure, KtList<City>>> watchSelectedCities() {
    return cityDao.watchAllCities().map((citiesList) {
      return right<CityFailure, KtList<City>>(citiesList.toImmutableList());
    }).onErrorReturnWith((e) {
      if (e is MoorWrappedException) {
        return left(const CityFailure.unableToFetch());
      }
      return left(CityFailure.unknown(message: e.toString()));
    });
  }

  @override
  Future<void> selectCity(City city) async {
    await cityDao.insertCity(city);
  }

  @override
  Future<KtList<int>> getSelectedCityIds() async {
    final ids = await cityDao.getAllIds();
    return ids.toImmutableList();
  }
}
