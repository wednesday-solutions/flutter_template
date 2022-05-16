import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

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

final m3Light = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.signika().fontFamily,
  snackBarTheme: const SnackBarThemeData(),
  cardTheme: const _AppCardTheme(),
  colorScheme: ColorScheme.fromSeed(
    seedColor: HexColor('#6c8cf5'),
    brightness: Brightness.light,
  ),
);

final m3Dark = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.signika().fontFamily,
  snackBarTheme: const SnackBarThemeData(),
  cardTheme: const _AppCardTheme(),
  colorScheme: ColorScheme.fromSeed(
    seedColor: HexColor('#6c8cf5'),
    brightness: Brightness.dark,
  ),
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
