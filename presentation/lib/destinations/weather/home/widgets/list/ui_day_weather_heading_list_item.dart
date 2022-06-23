import 'package:flutter/material.dart';
import 'package:presentation_entity/presentation_entity.dart';

class UIDayWeatherHeadingListItem extends StatelessWidget {
  final UIDayWeatherHeading heading;

  const UIDayWeatherHeadingListItem({
    Key? key,
    required this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      heading.text,
      style: const TextStyle(fontSize: 20),
    );
  }
}
