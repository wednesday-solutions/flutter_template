import 'dart:async';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_template/presentation/base/renderer/list_item_renderer.dart';
import 'package:flutter_template/presentation/entity/weather/ui_day_weather.dart';
import 'package:flutter_template/presentation/weather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/weather/home/list/ui_day_weather_list_item.dart';

class UIDayWeatherRenderer
    extends ListItemRenderer<UIDayWeather, HomeScreenIntent> {
  @override
  Widget getWidget(BuildContext context, UIDayWeather data,
      StreamSink<HomeScreenIntent> sink) {
    return UIDayWeatherListItem(dayWeather: data);
  }
}
