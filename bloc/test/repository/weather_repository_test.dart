import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_template_bloc/core/failures/city_failure.dart';
import 'package:flutter_template_bloc/core/failures/weather_failure.dart';
import 'package:flutter_template_bloc/data/model/city.dart';
import 'package:flutter_template_bloc/data/model/weather.dart';
import 'package:flutter_template_bloc/data/repository/weather_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/collection.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import '../mocks/city_dao_mock.dart';
import '../mocks/city_mock.dart';
import '../mocks/weather_api_service_mock.dart';
import '../mocks/weather_mock.dart';

void main() {
  group('Weather Repository', () {
    WeatherRepository weatherRepository;
    MockCityDao mockCityDao;
    MockWeatherApiService mockWeatherApiService;

    setUp(() {
      mockCityDao = MockCityDao();
      mockWeatherApiService = MockWeatherApiService();
      weatherRepository = WeatherRepository(mockCityDao, mockWeatherApiService);
    });

    group('getWeatherForAllCities', () {
      test('returns weather for all cities', () async {
        mockCityDao.mockGetAllCities([mockCity1, mockCity2]);
        mockWeatherApiService.mockWeatherForCity(1, mockWeather1);
        mockWeatherApiService.mockWeatherForCity(2, mockWeather2);

        final weatherForAllCities =
            await weatherRepository.getWeatherForAllCities();

        verifyInOrder([
          mockCityDao.getAllCities(),
          mockWeatherApiService.weatherForCity(1),
          mockWeatherApiService.weatherForCity(2)
        ]);
        expect(weatherForAllCities.isRight(), isTrue);
        expect(weatherForAllCities.getOrElse(null),
            KtList.of(mockWeather1, mockWeather2));
      });

      test('returns WeatherFailure on database exception', () async {
        mockCityDao.mockGetAllCitiesException();
        mockWeatherApiService.mockWeatherForCity(1, mockWeather1);
        mockWeatherApiService.mockWeatherForCity(2, mockWeather2);

        final Either<WeatherFailure, KtList<Weather>> weatherForAllCities =
            await weatherRepository.getWeatherForAllCities();

        verify(mockCityDao.getAllCities()).called(1);
        verifyNever(mockWeatherApiService.weatherForCity(1));

        expect(weatherForAllCities.isLeft(), isTrue);
        expect(weatherForAllCities,
            left(const WeatherFailure.unableToFetch(message: 'Test Failure')));
      });

      test('returns WeatherFailure on dio exception', () async {
        mockCityDao.mockGetAllCities([mockCity1, mockCity2]);
        mockWeatherApiService.mockWeatherForCity(1, mockWeather1);
        mockWeatherApiService.mockWeatherForCityException(2,
            DioError(error: 'test error', type: DioErrorType.CONNECT_TIMEOUT));

        final Either<WeatherFailure, KtList<Weather>> weatherForAllCities =
            await weatherRepository.getWeatherForAllCities();

        verifyInOrder([
          mockCityDao.getAllCities(),
          mockWeatherApiService.weatherForCity(1),
          mockWeatherApiService.weatherForCity(2)
        ]);

        expect(weatherForAllCities.isLeft(), isTrue);
        expect(weatherForAllCities,
            left(const WeatherFailure.requestTimeOut(message: 'test error')));
      });
    });

    group('watchWeatherForAllCities', () {
      test('returns stream of weather of all selected cities', () async {
        final StreamController<List<City>> controller = StreamController();
        controller.sink.add([mockCity1]);
        mockCityDao.mockWatchAllCities(controller.stream);
        mockWeatherApiService.mockWeatherForCity(1, mockWeather1);
        mockWeatherApiService.mockWeatherForCity(2, mockWeather2);

        final expectation = expectLater(
            weatherRepository.watchWeatherForAllCities(),
            emitsInOrder([
              right(KtList.of(mockWeather1)),
              right(KtList.of(mockWeather1, mockWeather2))
            ]));

        controller.sink.add([mockCity1, mockCity2]);
        await expectation;
      });

      test('returns stream with WeatherFailure when an exception occurs',
          () async {
        final StreamController<List<City>> controller = StreamController();
        controller.sink.add([mockCity1]);
        mockCityDao.mockWatchAllCities(controller.stream);
        mockWeatherApiService.mockWeatherForCity(1, mockWeather1);
        mockWeatherApiService.mockWeatherForCityException(2,
            DioError(type: DioErrorType.RECEIVE_TIMEOUT, error: 'Test Error'));

        final expectation = expectLater(
            weatherRepository.watchWeatherForAllCities(),
            emitsInOrder([
              right(KtList.of(mockWeather1)),
              left(const WeatherFailure.requestTimeOut(message: 'Test Error'))
            ]));

        controller.sink.add([mockCity1, mockCity2]);
        await expectation;
      });
    });

    group('searchCities', () {
      const searchTerm = 'test city';

      test('returns a list of cities for given search term', () async {
        mockWeatherApiService.mockSearchCities(searchTerm);

        final searchResult =
            await weatherRepository.searchCities(searchTerm: searchTerm);

        verify(mockWeatherApiService.searchCities(searchTerm)).called(1);
        expect(searchResult.isRight(), isTrue);
        expect(searchResult, right(KtList.of(mockCity1, mockCity2)));
      });

      test(
          'return CityFailure.noMatchingResults if no results are present for current search term',
          () async {
        mockWeatherApiService.mockSearchCities(searchTerm, mockEmpty: true);

        final searchResults =
            await weatherRepository.searchCities(searchTerm: searchTerm);

        verify(mockWeatherApiService.searchCities(searchTerm)).called(1);
        expect(searchResults.isLeft(), isTrue);
        expect(searchResults, left(const CityFailure.noMatchingResults()));
      });

      test('return CityFailure if an Exception occurs', () async {
        mockWeatherApiService.mockSearchCitiesException(searchTerm,
            DioError(type: DioErrorType.CONNECT_TIMEOUT, error: 'Test Error'));

        final searchResults =
            await weatherRepository.searchCities(searchTerm: searchTerm);

        verify(mockWeatherApiService.searchCities(searchTerm)).called(1);
        expect(searchResults.isLeft(), isTrue);
        expect(searchResults,
            left(const CityFailure.requestTimeOut(message: 'Test Error')));
      });
    });

    group('watchAllSelectedCities', () {
      test('returns stream of list of city', () async {
        final StreamController<List<City>> controller = StreamController();
        controller.sink.add([mockCity1]);
        mockCityDao.mockWatchAllCities(controller.stream);

        final expectation = expectLater(
            weatherRepository.watchSelectedCities(),
            emitsInOrder([
              right(KtList.of(mockCity1)),
              right(KtList.of(mockCity1, mockCity2))
            ]));

        controller.sink.add([mockCity1, mockCity2]);
        await expectation;
      });
    });

    group('selectCity', () {
      test('inserts the selected city in database', () async {
        mockCityDao.mockInsertCity(mockCity1);

        await weatherRepository.selectCity(mockCity1);

        verify(mockCityDao.insertCity(mockCity1)).called(1);
      });
    });

    group('getSelectedCityIds', () {
      test('returns list of selected city ids', () async {
        mockCityDao.mockGetAllIds([1, 2]);

        final selectedIds = await weatherRepository.getSelectedCityIds();

        verify(mockCityDao.getAllIds()).called(1);
        expect(selectedIds, KtList.of(1, 2));
      });
    });
  });
}
