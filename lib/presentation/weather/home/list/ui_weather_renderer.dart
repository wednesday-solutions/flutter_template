import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/renderer/list_item_renderer.dart';
import 'package:flutter_template/presentation/entity/weather/ui_weather.dart';
import 'package:flutter_template/presentation/weather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/weather/home/list/ui_weather_list_item.dart';

class UIWeatherRenderer extends ListItemRenderer<UIWeather, HomeScreenIntent> {
  const UIWeatherRenderer();

  @override
  Widget getWidget(
      BuildContext context, UIWeather data, StreamSink<HomeScreenIntent> sink) {
    return UIWeatherListItem(weather: data);
  }
}
