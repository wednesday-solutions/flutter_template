// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_City _$_$_CityFromJson(Map<String, dynamic> json) {
  return _$_City(
    json['woeid'] as int,
    json['title'] as String,
    json['location_type'] as String,
    isSelected: json['isSelected'] as bool ?? false,
  );
}

Map<String, dynamic> _$_$_CityToJson(_$_City instance) => <String, dynamic>{
      'woeid': instance.woeid,
      'title': instance.title,
      'location_type': instance.locationType,
      'isSelected': instance.isSelected,
    };
