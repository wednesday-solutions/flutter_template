import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_location.g.dart';

@JsonSerializable()
class RemoteLocation {
  final String country;
  final double lat;
  final double lon;
  final String name;
  final String? state;

  RemoteLocation({
    required this.country,
    required this.lat,
    required this.lon,
    required this.name,
    this.state,
  });

  factory RemoteLocation.fromJson(Map<String, dynamic> json) =>
      _$RemoteLocationFromJson(json);
}
