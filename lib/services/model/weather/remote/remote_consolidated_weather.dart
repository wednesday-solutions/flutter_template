import 'package:flutter_template/services/base/json/JsonDateTimeConverter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_consolidated_weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RemoteConsolidatedWeather {
  final double id;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  @JsonKey(
    name: "applicable_date",
    toJson: JsonDateTimeConverter.toJson,
    fromJson: JsonDateTimeConverter.fromJson,
  )
  final DateTime date;

  RemoteConsolidatedWeather(
    this.id,
    this.minTemp,
    this.maxTemp,
    this.theTemp,
    this.date,
  );

  factory RemoteConsolidatedWeather.fromJson(Map<String, dynamic> json) =>
      _$RemoteConsolidatedWeatherFromJson(json);
}
