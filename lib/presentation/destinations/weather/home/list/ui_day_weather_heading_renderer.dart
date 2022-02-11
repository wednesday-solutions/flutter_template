import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_template/presentation/base/renderer/list_item_renderer.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/weather/home/list/ui_day_weather_heading_list_item.dart';
import 'package:flutter_template/presentation/entity/weather/ui_day_weather_heading.dart';

class UIDayWeatherHeaderRenderer
    extends ListItemRenderer<UIDayWeatherHeading, HomeScreenIntent> {
  const UIDayWeatherHeaderRenderer();
  @override
  Widget getWidget(BuildContext context, UIDayWeatherHeading data,
      StreamSink<HomeScreenIntent> sink) {
    return UIDayWeatherHeadingListItem(heading: data);
  }
}
