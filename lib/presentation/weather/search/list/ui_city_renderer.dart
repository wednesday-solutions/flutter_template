import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/renderer/list_item_renderer.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';
import 'package:flutter_template/presentation/weather/search/list/ui_city_list_item.dart';
import 'package:flutter_template/presentation/weather/search/search_screen_intent.dart';

class UICityRenderer extends ListItemRenderer<UICity, SearchScreenIntent> {
  @override
  Widget getWidget(
      BuildContext context, UICity data, StreamSink<SearchScreenIntent> sink) {
    return UICityListItem(
      city: data,
      sink: sink,
    );
  }
}
