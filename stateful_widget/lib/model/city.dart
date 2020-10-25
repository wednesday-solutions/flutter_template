import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  int woeid;
  String title;

  @JsonKey(name: 'location_type')
  final String locationType;

  City(this.woeid, this.title, this.locationType);

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}
