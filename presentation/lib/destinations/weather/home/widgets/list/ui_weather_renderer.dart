import 'dart:async';

import 'package:flutter/material.dart';
import 'package:presentation/base/renderer/list_item_renderer.dart';
import 'package:presentation/destinations/weather/home/home_screen_intent.dart';
import 'package:presentation/destinations/weather/home/widgets/list/ui_weather_list_item.dart';
import 'package:presentation_entity/presentation_entity.dart';

class UIWeatherRenderer extends ListItemRenderer<UIWeather, HomeScreenIntent> {
  const UIWeatherRenderer();

  @override
  Widget getWidget(
      BuildContext context, UIWeather data, StreamSink<HomeScreenIntent> sink) {
    return UIWeatherListItem(weather: data);
  }
}
