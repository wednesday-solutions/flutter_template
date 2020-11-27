import 'package:flutter_template_bloc/data/model/consolidated_weather.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';
part 'weather.freezed.dart';

@freezed
abstract class Weather with _$Weather {
  const factory Weather(
    String title,
    @JsonKey(name: 'consolidated_weather')
        List<ConsolidatedWeather> consolidatedWeathers,
  ) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
