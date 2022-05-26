import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_current_weather_clouds.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RemoteCurrentWeatherClouds {
  final int all;

  RemoteCurrentWeatherClouds({
    required this.all,
  });

  factory RemoteCurrentWeatherClouds.fromJson(Map<String, dynamic> json) =>
      _$RemoteCurrentWeatherCloudsFromJson(json);
}
