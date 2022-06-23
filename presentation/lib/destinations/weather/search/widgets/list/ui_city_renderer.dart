import 'dart:async';

import 'package:flutter/material.dart';
import 'package:presentation/base/renderer/list_item_renderer.dart';
import 'package:presentation/destinations/weather/search/search_screen_intent.dart';
import 'package:presentation/destinations/weather/search/widgets/list/ui_city_list_item.dart';
import 'package:presentation_entity/presentation_entity.dart';

class UICityRenderer extends ListItemRenderer<UICity, SearchScreenIntent> {
  const UICityRenderer();
  @override
  Widget getWidget(
      BuildContext context, UICity data, StreamSink<SearchScreenIntent> sink) {
    return UICityListItem(
      city: data,
      sink: sink,
    );
  }
}
