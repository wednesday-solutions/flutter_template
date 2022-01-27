import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  snackBarTheme: const SnackBarThemeData(),
  appBarTheme: const AppBarTheme(),
  cardTheme: const _AppCardTheme(),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  snackBarTheme: const SnackBarThemeData(),
  appBarTheme: const AppBarTheme(),
  cardTheme: const _AppCardTheme(),
);

class _AppCardTheme extends CardTheme {
  final ShapeBorder? shapeBorder;

  const _AppCardTheme({
    this.shapeBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
  }) : super(shape: shapeBorder);
}
