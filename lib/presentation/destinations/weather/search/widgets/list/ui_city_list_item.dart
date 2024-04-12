import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen_intent.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';

class UICityListItem extends StatelessWidget {
  final UICity city;
  final StreamSink<SearchScreenIntent> sink;

  const UICityListItem({
    super.key,
    required this.city,
    required this.sink,
  });

  @override
  Widget build(BuildContext context) {
    final title = city.title + (city.state != null ? ", ${city.state}" : "");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title)),
          IconButton(
            icon: Icon(
              city.isFavourite ? Icons.favorite : Icons.favorite_outline,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              sink.add(ToggleFavoriteSearchScreenIntent(city: city));
            },
          ),
        ],
      ),
    );
  }
}
