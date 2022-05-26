import 'package:json_annotation/json_annotation.dart';

part 'remote_current_weather_sys.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RemoteCurrentWeatherSys {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  RemoteCurrentWeatherSys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory RemoteCurrentWeatherSys.fromJson(Map<String, dynamic> json) =>
      _$RemoteCurrentWeatherSysFromJson(json);
}
