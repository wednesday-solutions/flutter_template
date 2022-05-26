import 'package:json_annotation/json_annotation.dart';

part 'remote_current_weather_wind.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RemoteCurrentWeatherWind {
  final double speed;
  final int deg;
  final double gust;

  RemoteCurrentWeatherWind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory RemoteCurrentWeatherWind.fromJson(Map<String, dynamic> json) =>
      _$RemoteCurrentWeatherWindFromJson(json);
}
