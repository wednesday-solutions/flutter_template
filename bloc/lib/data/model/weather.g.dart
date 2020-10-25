// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Weather _$_$_WeatherFromJson(Map<String, dynamic> json) {
  return _$_Weather(
    json['title'] as String,
    (json['consolidated_weather'] as List)
        ?.map((e) => e == null
            ? null
            : ConsolidatedWeather.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_WeatherToJson(_$_Weather instance) =>
    <String, dynamic>{
      'title': instance.title,
      'consolidated_weather': instance.consolidatedWeathers,
    };
