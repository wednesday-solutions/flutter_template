import 'package:flutter_template/services/base/database/app_database.dart';
import 'package:flutter_template/services/entity/weather/local/local_city_with_weather.dart';

abstract class WeatherLocalService {
  Stream<List<LocalCityData>> getFavoriteCitiesStream();

  Future<List<LocalCityData>> getFavouriteCities();

  Future<void> markCityAsFavorite({required LocalCityCompanion city});

  Future<void> deleteFavoriteCity({required LocalCityCompanion city});

  Future<void> addLocalWeather({required LocalWeatherCompanion weather});

  Future<void> deleteLocalWeather({required int woeid});

  Future<List<LocalDayWeatherData>> getLocalDayWeather({required int woeid});

  Future<void> addLocalDayWeather({required LocalDayWeatherCompanion weather});

  Future<void> deleteLocalDayWeather({required int woeid});

  Future<void> deleteCurrentAndAddNewWeatherData({
    required int woeid,
    required LocalWeatherCompanion weather,
    required List<LocalDayWeatherCompanion> weatherList,
  });

  Future<LocalWeatherData?> getLocalWeather({required int woeid});

  Future<List<LocalCityWithWeather>> getFavoriteCitiesWeatherList();

  Stream<List<LocalCityWithWeather>> getFavoriteCitiesWeatherStream();
}
