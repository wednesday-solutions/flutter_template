import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_city.freezed.dart';
part 'remote_city.g.dart';

@freezed
class RemoteCity with _$RemoteCity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory RemoteCity({
    required int woeid,
    required String title,
    required String location_type,
    @JsonKey(name: "latt_long") required String location,
  }) = _RemoteCity;

  factory RemoteCity.fromJson(Map<String, dynamic> json) =>
      _$RemoteCityFromJson(json);
}
