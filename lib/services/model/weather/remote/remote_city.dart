import 'package:json_annotation/json_annotation.dart';

part 'remote_city.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RemoteCity {
  final int woeid;
  final String title;
  final String locationType;
  @JsonKey(name: "latt_long")
  final String location;

  const RemoteCity({
    required this.woeid,
    required this.title,
    required this.locationType,
    required this.location,
  });

  factory RemoteCity.fromJson(Map<String, dynamic> json) =>
      _$RemoteCityFromJson(json);
}
