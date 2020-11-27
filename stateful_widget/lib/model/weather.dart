import 'package:flutter_template/model/consolidated_weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  String title;

  @JsonKey(name: 'consolidated_weather')
  final List<ConsolidatedWeather> consolidatedWeathers;

  Weather(
      this.title,
      this.consolidatedWeathers
  );

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
