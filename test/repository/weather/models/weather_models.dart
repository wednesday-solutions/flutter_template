import 'package:flutter_template/domain/entity/base/datetime/date.dart';
import 'package:flutter_template/domain/entity/weather/day_weather.dart';
import 'package:flutter_template/domain/entity/weather/weather.dart';

final weatherList = [
  Weather(
    title: "title 1",
    woeid: 1,
    dayWeatherList: [
      DayWeather(
        minTemp: 19,
        maxTemp: 28,
        temp: 22,
        date: const Date(year: 1970, month: 1, day: 1),
        isToday: false,
      )
    ],
  ),
];
