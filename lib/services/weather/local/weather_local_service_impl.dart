import 'package:drift/drift.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';
import 'package:flutter_template/services/base/database/app_database.dart';
import 'package:flutter_template/services/entity/open_weather/current_weather/local/local_current_weather.dart';
import 'package:flutter_template/services/entity/open_weather/geo_coding/local/local_location.dart';
import 'package:flutter_template/services/weather/local/weather_local_service.dart';

part 'weather_local_service_impl.g.dart';

@DriftAccessor(tables: [
  LocalLocation,
  LocalCurrentWeather,
])
class WeatherLocalServiceImpl extends DatabaseAccessor<AppDatabase>
    with _$WeatherLocalServiceImplMixin
    implements WeatherLocalService {
  WeatherLocalServiceImpl(super.attachedDatabase);

  @override
  Future<void> deleteFavoriteCity({required LocalLocationCompanion city}) {
    logD("deleteFavoriteCity: city = $city");
    return delete(localLocation).delete(city);
  }

  @override
  Future deleteLocalCurrentWeather(
      {required double lat, required double lon}) async {
    logD("deleteLocalCurrentWeather: lat = $lat, lon = $lon");
    return (delete(localCurrentWeather)
          ..where(
            (tbl) => tbl.coordLat.equals(lat) & tbl.coordLon.equals(lon),
          ))
        .go();
  }

  @override
  Stream<List<LocalLocationData>> getFavoriteCitiesStream() {
    logD("getFavoriteCitiesStream");
    return select(localLocation).watch();
  }

  @override
  Future<List<LocalCurrentWeatherData>> getFavoriteCitiesWeatherList() {
    logD("getFavoriteCitiesWeatherList");
    return select(localCurrentWeather).get();
  }

  @override
  Stream<List<LocalCurrentWeatherData>> getFavoriteCitiesWeatherStream() {
    logD("getFavoriteCitiesWeatherStream");
    return select(localCurrentWeather).watch();
  }

  @override
  Future<List<LocalLocationData>> getFavouriteCities() {
    logD("getFavoriteCities");
    return select(localLocation).get();
  }

  @override
  Future<LocalCurrentWeatherData?> getLocalCurrentWeather({
    required double lat,
    required double lon,
  }) {
    logD("getLocalCurrentWeather: lat = $lat, lon = $lon");
    return (select(localCurrentWeather)
          ..where((tbl) => tbl.coordLat.equals(lat) & tbl.coordLon.equals(lon)))
        .getSingleOrNull();
  }

  @override
  Future<void> markCityAsFavorite({required LocalLocationCompanion city}) {
    logD("markCityAsFavorite: city = $city");
    return into(localLocation).insert(city, mode: InsertMode.insertOrReplace);
  }

  @override
  Future<void> upsertLocalCurrentWeather(
      {required LocalCurrentWeatherCompanion weather}) {
    logD("upsertLocalCurrentWeather: weather = $weather");
    return into(localCurrentWeather)
        .insert(weather, mode: InsertMode.insertOrReplace);
  }
}
