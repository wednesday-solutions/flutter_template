import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_template/services/base/database/app_database.dart';
import 'package:flutter_template/services/entity/weather/local/local_city.dart';
import 'package:flutter_template/services/entity/weather/local/local_city_with_weather.dart';
import 'package:flutter_template/services/entity/weather/local/local_day_weather.dart';
import 'package:flutter_template/services/entity/weather/local/local_weather.dart';
import 'package:flutter_template/services/weather/local/weather_local_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_local_service_impl.g.dart';

@DriftAccessor(tables: [LocalCity, LocalWeather, LocalDayWeather])
class WeatherLocalServiceImpl extends DatabaseAccessor<AppDatabase>
    with _$WeatherLocalServiceImplMixin
    implements WeatherLocalService {
  WeatherLocalServiceImpl(AppDatabase attachedDatabase)
      : super(attachedDatabase);

  @override
  Future<void> addLocalDayWeather(
      {required LocalDayWeatherCompanion weather}) async {
    await into(localDayWeather).insert(
      weather,
      mode: InsertMode.insertOrReplace,
    );
  }

  @override
  Future<void> addLocalWeather({required LocalWeatherCompanion weather}) async {
    await into(localWeather).insert(
      weather,
      mode: InsertMode.insertOrReplace,
    );
  }

  @override
  Future<void> deleteCurrentAndAddNewWeatherData(
      {required int woeid,
      required LocalWeatherCompanion weather,
      required List<LocalDayWeatherCompanion> weatherList}) async {
    await transaction(
      () async {
        await deleteLocalWeather(woeid: woeid);
        await deleteLocalDayWeather(woeid: woeid);

        await addLocalWeather(weather: weather);

        await Future.forEach(
          weatherList,
          (LocalDayWeatherCompanion dayWeather) async {
            await addLocalDayWeather(weather: dayWeather);
          },
        );
      },
    );
  }

  @override
  Future<void> deleteFavoriteCity({required LocalCityCompanion city}) async {
    await delete(localCity).delete(city);
  }

  @override
  Future<void> deleteLocalDayWeather({required int woeid}) async {
    delete(localDayWeather)
      ..where((tbl) => tbl.cityWoeid.equals(woeid))
      ..go();
  }

  @override
  Future<void> deleteLocalWeather({required int woeid}) async {
    delete(localWeather)
      ..where((tbl) => tbl.cityWoeid.equals(woeid))
      ..go();
  }

  @override
  Stream<List<LocalCityData>> getFavoriteCitiesStream() {
    return select(localCity).watch();
  }

  @override
  Future<List<LocalCityData>> getFavouriteCities() async {
    return await select(localCity).get();
  }

  @override
  Future<List<LocalDayWeatherData>> getLocalDayWeather(
      {required int woeid}) async {
    return await (select(localDayWeather)
          ..where((tbl) => tbl.cityWoeid.equals(woeid)))
        .get();
  }

  @override
  Future<LocalWeatherData?> getLocalWeather({required int woeid}) async {
    return await (select(localWeather)
          ..where((tbl) => tbl.cityWoeid.equals(woeid)))
        .getSingleOrNull();
  }

  @override
  Future<void> markCityAsFavorite({required LocalCityCompanion city}) async {
    await into(localCity).insertOnConflictUpdate(city);
  }

  @override
  Future<List<LocalCityWithWeather>> getFavoriteCitiesWeatherList() async {
    final typedResultList = await _getLocalCityWithWeatherQuery().get();

    return _getLocalCityWithWeatherList(typedResultList);
  }

  @override
  Stream<List<LocalCityWithWeather>> getFavoriteCitiesWeatherStream() {
    return _getLocalCityWithWeatherQuery().watch().map(
      (typedResultList) {
        return _getLocalCityWithWeatherList(typedResultList);
      },
    );
  }

  JoinedSelectStatement<HasResultSet, dynamic> _getLocalCityWithWeatherQuery() {
    return select(localCity).join(
      [
        innerJoin(
          localWeather,
          localWeather.cityWoeid.equalsExp(localCity.woeid),
        ),
        innerJoin(
          localDayWeather,
          localDayWeather.cityWoeid.equalsExp(localCity.woeid),
        )
      ],
    );
  }

  List<LocalCityWithWeather> _getLocalCityWithWeatherList(
      List<TypedResult> typedResult) {
    final groupedByWoeid = groupBy(typedResult, (TypedResult row) {
      final localCityData = row.readTable(localCity);
      return localCityData.woeid;
    });

    final localCityWithWeatherList =
        List<LocalCityWithWeather>.empty(growable: true);

    groupedByWoeid.forEach((key, results) {
      final localCityData = results.first.readTable(localCity);
      final localWeatherData = results.first.readTable(localWeather);
      final dayWeatherList = results
          .map(
            (row) => row.readTable(localDayWeather),
          )
          .toList();

      localCityWithWeatherList.add(LocalCityWithWeather(
        city: localCityData,
        weather: localWeatherData,
        dayWeather: dayWeatherList,
      ));
    });

    return localCityWithWeatherList;
  }
}
