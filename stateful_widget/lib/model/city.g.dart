// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    json['woeid'] as int,
    json['title'] as String,
    json['location_type'] as String,
  );
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'woeid': instance.woeid,
      'title': instance.title,
      'location_type': instance.locationType,
    };
