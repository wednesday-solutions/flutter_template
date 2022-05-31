import 'package:json_annotation/json_annotation.dart';

part 'remote_current_weather_coord.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RemoteCurrentWeatherCoord {
  final double lon;
  final double lat;

  RemoteCurrentWeatherCoord({
    required this.lon,
    required this.lat,
  });

  factory RemoteCurrentWeatherCoord.fromJson(Map<String, dynamic> json) =>
      _$RemoteCurrentWeatherCoordFromJson(json);
}
