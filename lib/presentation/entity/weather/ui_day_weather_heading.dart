import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_day_weather_heading.freezed.dart';

@freezed
class UIDayWeatherHeading with _$UIDayWeatherHeading implements UIListItem {
  const UIDayWeatherHeading._();

  const factory UIDayWeatherHeading({
    required String text,
  }) = _UIDayWeatherHeading;

  @override
  String get key => "UIDayWeatherHeading";

  @override
  Type get type => UIDayWeatherHeading;
}
