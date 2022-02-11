import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/renderer/list_item_renderer.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/weather/home/list/ui_day_weather_list_item.dart';
import 'package:flutter_template/presentation/entity/weather/ui_day_weather.dart';

class UIDayWeatherRenderer
    extends ListItemRenderer<UIDayWeather, HomeScreenIntent> {
  const UIDayWeatherRenderer();

  @override
  Widget getWidget(BuildContext context, UIDayWeather data,
      StreamSink<HomeScreenIntent> sink) {
    return UIDayWeatherListItem(dayWeather: data);
  }
}
