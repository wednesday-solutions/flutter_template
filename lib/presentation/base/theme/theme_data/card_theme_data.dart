import 'package:flutter/material.dart';

class AppCardTheme extends CardTheme {
  final ShapeBorder? shapeBorder;
  final Color cardColor;

  const AppCardTheme({
    this.shapeBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    required this.cardColor,
  }) : super(shape: shapeBorder, color: cardColor);
}
