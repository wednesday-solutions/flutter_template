import 'package:flutter_template/foundation/global_type_alias.dart';
import 'package:flutter_template/services/base/json/json_date_time_converter.dart';
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
  final DartDateTime date;

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
