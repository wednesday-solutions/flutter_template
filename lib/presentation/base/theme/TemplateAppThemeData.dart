import 'package:flutter/material.dart';

final LightTheme = ThemeData(
  brightness: Brightness.light,
  snackBarTheme: const SnackBarThemeData(),
  appBarTheme: const AppBarTheme(),
  cardTheme: const _AppCardTheme(),
);

final DarkTheme = ThemeData(
  brightness: Brightness.dark,
  snackBarTheme: const SnackBarThemeData(),
  appBarTheme: const AppBarTheme(),
  cardTheme: const _AppCardTheme(),
);

class _AppCardTheme extends CardTheme {
  final ShapeBorder? shape;

  const _AppCardTheme({
    this.shape = const RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(8),
      ),
    ),
  }) : super(shape: shape);
}
