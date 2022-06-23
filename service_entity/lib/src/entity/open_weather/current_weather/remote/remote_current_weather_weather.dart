import 'package:json_annotation/json_annotation.dart';

part 'remote_current_weather_weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RemoteCurrentWeatherWeather {
  final int id;
  final String main;
  final String description;
  final String icon;

  RemoteCurrentWeatherWeather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory RemoteCurrentWeatherWeather.fromJson(Map<String, dynamic> json) =>
      _$RemoteCurrentWeatherWeatherFromJson(json);
}
