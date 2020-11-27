import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city.freezed.dart';
part 'city.g.dart';

@freezed
abstract class City with _$City {
  const factory City(int woeid, String title,
      @JsonKey(name: 'location_type') String locationType,
      {@Default(false) bool isSelected}) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}
