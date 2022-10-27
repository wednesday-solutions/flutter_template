import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_weather.freezed.dart';

@freezed
class UIWeather with _$UIWeather implements UIListItem {
  const UIWeather._();

  const factory UIWeather({
    required double lat,
    required double lon,
    required String title,
    required String description,
    required String currentTemp,
    required String minMaxTemp,
    required String feelsLike,
    required String iconUrl,
  }) = _UIWeather;

  @override
  String get key => "UIWeather $lat $lon";

  @override
  Type get type => UIWeather;
}
