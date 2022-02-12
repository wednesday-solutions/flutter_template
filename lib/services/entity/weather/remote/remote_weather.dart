import 'package:flutter_template/services/entity/weather/remote/remote_consolidated_weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RemoteWeather {
  final String title;
  final List<RemoteConsolidatedWeather> consolidatedWeather;

  RemoteWeather(this.title, this.consolidatedWeather);

  factory RemoteWeather.fromJson(Map<String, dynamic> json) =>
      _$RemoteWeatherFromJson(json);
}
