import 'package:flutter/foundation.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_weather.freezed.dart';

@freezed
class UIWeather with _$UIWeather implements UIListItem {
  const UIWeather._();

  const factory UIWeather({
    required int cityId,
    required String title,
    required String currentTemp,
    required String minMaxTemp,
    required List<UIListItem> dayWeatherList,
  }) = _UIWeather;

  @override
  String get key => "UIWeather $cityId";

  @override
  Type get type => UIWeather;
}
