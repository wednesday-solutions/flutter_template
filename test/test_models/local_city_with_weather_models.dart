import 'package:flutter_template/services/base/database/app_database.dart';
import 'package:flutter_template/services/entity/weather/local/local_city_with_weather.dart';

import 'local_day_weather_models.dart';

final localCityWithWeatherList = [
  LocalCityWithWeather(
    city: LocalCityData(
        woeid: 1,
        title: "title 1",
        locationType: "locationType 1",
        location: "location 1"),
    weather: LocalWeatherData(
      title: "title 1",
      cityWoeid: 1,
    ),
    dayWeather: [...localDayWeatherList],
  ),
];
