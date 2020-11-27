import 'package:flutter/cupertino.dart';
import 'package:flutter_template_bloc/data/model/weather_condition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'consolidated_weather.g.dart';
part 'consolidated_weather.freezed.dart';

@freezed
abstract class ConsolidatedWeather implements _$ConsolidatedWeather {
  const factory ConsolidatedWeather(
    int id,
    @JsonKey(name: 'weather_state_name') String weatherStateName,
    @JsonKey(name: 'weather_state_abbr') String weatherStateAbbr,
    @JsonKey(name: 'wind_direction_compass') String windDirectionCompass,
    @JsonKey(name: 'min_temp') num minTemp,
    @JsonKey(name: 'max_temp') num maxTemp,
    @JsonKey(name: 'the_temp') num theTemp,
    @JsonKey(name: 'wind_speed') num windSpeed,
    @JsonKey(name: 'wind_direction') num windDirection,
    @JsonKey(name: 'air_pressure') num airPressure,
    num humidity,
    num visibility,
    num predictability,
  ) = _ConsolidatedWeather;

  const ConsolidatedWeather._();
  
  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) =>
      _$ConsolidatedWeatherFromJson(json);

  Image weatherConditionImage() {
    Image image;
    switch (weatherCondition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        image = Image.asset('assets/clear.png');
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        image = Image.asset('assets/snow.png');
        break;
      case WeatherCondition.heavyCloud:
        image = Image.asset('assets/cloudy.png');
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        image = Image.asset('assets/rainy.png');
        break;
      case WeatherCondition.thunderstorm:
        image = Image.asset('assets/thunderstorm.png');
        break;
      case WeatherCondition.unknown:
        image = Image.asset('assets/clear.png');
        break;
    }
    return image;
  }

  WeatherCondition get weatherCondition {
    WeatherCondition state;
    switch (weatherStateAbbr) {
      case 'sn':
        state = WeatherCondition.snow;
        break;
      case 'sl':
        state = WeatherCondition.sleet;
        break;
      case 'h':
        state = WeatherCondition.hail;
        break;
      case 't':
        state = WeatherCondition.thunderstorm;
        break;
      case 'hr':
        state = WeatherCondition.heavyRain;
        break;
      case 'lr':
        state = WeatherCondition.lightRain;
        break;
      case 's':
        state = WeatherCondition.showers;
        break;
      case 'hc':
        state = WeatherCondition.heavyCloud;
        break;
      case 'lc':
        state = WeatherCondition.lightCloud;
        break;
      case 'c':
        state = WeatherCondition.clear;
        break;
      default:
        state = WeatherCondition.unknown;
    }
    return state;
  }
}
