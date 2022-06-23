import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:presentation/base/renderer/list_item_renderer.dart';
import 'package:presentation/destinations/weather/home/home_screen_intent.dart';
import 'package:presentation/destinations/weather/home/widgets/list/ui_day_weather_heading_list_item.dart';
import 'package:presentation_entity/presentation_entity.dart';

class UIDayWeatherHeaderRenderer extends ListItemRenderer<UIDayWeatherHeading, HomeScreenIntent> {
  const UIDayWeatherHeaderRenderer();
  @override
  Widget getWidget(
      BuildContext context, UIDayWeatherHeading data, StreamSink<HomeScreenIntent> sink) {
    return UIDayWeatherHeadingListItem(heading: data);
  }
}
