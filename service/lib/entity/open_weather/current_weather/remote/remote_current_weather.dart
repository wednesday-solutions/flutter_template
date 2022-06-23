import 'package:freezed_annotation/freezed_annotation.dart';

import 'remote_current_weather_clouds.dart';
import 'remote_current_weather_coord.dart';
import 'remote_current_weather_main.dart';
import 'remote_current_weather_sys.dart';
import 'remote_current_weather_weather.dart';
import 'remote_current_weather_wind.dart';

part 'remote_current_weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RemoteCurrentWeather {
  final RemoteCurrentWeatherCoord coord;
  final List<RemoteCurrentWeatherWeather> weather;
  final String base;
  final RemoteCurrentWeatherMain main;
  final int visibility;
  final RemoteCurrentWeatherWind wind;
  final RemoteCurrentWeatherClouds clouds;
  final int dt;
  final RemoteCurrentWeatherSys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  RemoteCurrentWeather({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory RemoteCurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$RemoteCurrentWeatherFromJson(json);
}
