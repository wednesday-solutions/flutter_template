import 'package:flutter_template/services/base/database/app_database.dart';

abstract interface class WeatherLocalService {
  Stream<List<LocalLocationData>> getFavoriteCitiesStream();

  Future<List<LocalLocationData>> getFavouriteCities();

  Future<void> markCityAsFavorite({required LocalLocationCompanion city});

  Future<void> deleteFavoriteCity({required LocalLocationCompanion city});

  Future<void> upsertLocalCurrentWeather(
      {required LocalCurrentWeatherCompanion weather});

  Future deleteLocalCurrentWeather({
    required double lat,
    required double lon,
  });

  Future<LocalCurrentWeatherData?> getLocalCurrentWeather({
    required double lat,
    required double lon,
  });

  Future<List<LocalCurrentWeatherData>> getFavoriteCitiesWeatherList();

  Stream<List<LocalCurrentWeatherData>> getFavoriteCitiesWeatherStream();
}
