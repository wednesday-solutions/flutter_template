import 'package:flutter_template/services/base/database/app_database.dart';

class LocalCityWithWeather {
  final LocalCityData city;
  final LocalWeatherData weather;
  final List<LocalDayWeatherData> dayWeather;

  LocalCityWithWeather({
    required this.city,
    required this.weather,
    required this.dayWeather,
  });
}
