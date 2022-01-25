import 'package:flutter_template/domain/entity/weather/day_weather.dart';

class Weather {
  final String title;
  final int woeid;
  final List<DayWeather> dayWeatherList;

  Weather({
    required this.title,
    required this.woeid,
    required this.dayWeatherList,
  });
}
