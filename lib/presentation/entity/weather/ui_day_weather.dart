// data class UIDayWeather(
// val cityId: Int,
// val currentTemp: UIText,
// val minMaxTemp: UIText,
// val date: UIText
// ) : UIListItemBase(id = "UICity $cityId $date")

import 'package:flutter/foundation.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_day_weather.freezed.dart';

@freezed
class UIDayWeather with _$UIDayWeather implements UIListItem {
  const UIDayWeather._();

  const factory UIDayWeather({
    required int cityId,
    required String currentTemp,
    required String minMaxTemp,
    required String date,
  }) = _UIDayWeather;

  @override
  String get key => "UICity $cityId $date";

  @override
  Type get type => UIDayWeather;
}
