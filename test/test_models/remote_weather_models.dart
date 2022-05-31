import 'package:flutter_template/services/entity/open_weather/current_weather/remote/remote_current_weather.dart';
import 'package:flutter_template/services/entity/open_weather/current_weather/remote/remote_current_weather_clouds.dart';
import 'package:flutter_template/services/entity/open_weather/current_weather/remote/remote_current_weather_coord.dart';
import 'package:flutter_template/services/entity/open_weather/current_weather/remote/remote_current_weather_main.dart';
import 'package:flutter_template/services/entity/open_weather/current_weather/remote/remote_current_weather_sys.dart';
import 'package:flutter_template/services/entity/open_weather/current_weather/remote/remote_current_weather_weather.dart';
import 'package:flutter_template/services/entity/open_weather/current_weather/remote/remote_current_weather_wind.dart';

final remoteWeather = RemoteCurrentWeather(
  coord: RemoteCurrentWeatherCoord(
    lon: 100.45,
    lat: 90.12,
  ),
  weather: [
    RemoteCurrentWeatherWeather(
      id: 1,
      main: "main",
      description: "description",
      icon: "01d",
    ),
  ],
  base: "base",
  main: RemoteCurrentWeatherMain(
    temp: 28.8,
    feelsLike: 32.45,
    tempMin: 21.45,
    tempMax: 34,
    pressure: 100,
    humidity: 78,
  ),
  visibility: 100,
  wind: RemoteCurrentWeatherWind(
    speed: 20,
    deg: 10,
  ),
  clouds: RemoteCurrentWeatherClouds(
    all: 4,
  ),
  dt: 1,
  sys: RemoteCurrentWeatherSys(
    country: "country 1",
    sunrise: 1234567,
    sunset: 4567123,
  ),
  timezone: 1,
  id: 1,
  name: "name 1",
  cod: 10,
);
