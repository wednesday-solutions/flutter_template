import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/renderer/list_item_renderer.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';
import 'package:flutter_template/presentation/weather/search/search_screen_intent.dart';
import 'package:get/get.dart';

class UICityRenderer extends ListItemRenderer<UICity, SearchScreenIntent> {
  @override
  Widget getWidget(
      BuildContext context, UICity data, StreamSink<SearchScreenIntent> sink) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(data.title),
          IconButton(
            icon: Icon(
                data.isFavourite ? Icons.favorite : Icons.favorite_outline, color: Get.theme.colorScheme.secondaryVariant,),
            onPressed: () {
              sink.add(SearchScreenIntent.toggleFavorite(city: data));
            },
          ),
        ],
      ),
    );
  }
}
