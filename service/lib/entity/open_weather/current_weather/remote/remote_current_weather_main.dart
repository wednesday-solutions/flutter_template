import 'package:json_annotation/json_annotation.dart';

part 'remote_current_weather_main.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RemoteCurrentWeatherMain {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  RemoteCurrentWeatherMain({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory RemoteCurrentWeatherMain.fromJson(Map<String, dynamic> json) =>
      _$RemoteCurrentWeatherMainFromJson(json);
}
