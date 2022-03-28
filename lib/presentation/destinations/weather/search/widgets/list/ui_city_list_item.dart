import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen_intent.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';

class UICityListItem extends StatelessWidget {
  final UICity city;
  final StreamSink<SearchScreenIntent> sink;

  const UICityListItem({
    Key? key,
    required this.city,
    required this.sink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(city.title)),
          IconButton(
            icon: Icon(
              city.isFavourite ? Icons.favorite : Icons.favorite_outline,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              sink.add(SearchScreenIntent.toggleFavorite(city: city));
            },
          ),
        ],
      ),
    );
  }
}
