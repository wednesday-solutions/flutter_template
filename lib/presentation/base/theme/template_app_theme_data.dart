import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/theme/color_palette.dart';
import 'package:google_fonts/google_fonts.dart';

final m3Light = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.signika().fontFamily,
  snackBarTheme: const SnackBarThemeData(),
  cardTheme: const _AppCardTheme(),
  colorScheme: lightColorScheme,
);

final m3Dark = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.signika().fontFamily,
  snackBarTheme: const SnackBarThemeData(),
  cardTheme: const _AppCardTheme(),
  colorScheme: darkColorScheme,
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
