import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/theme/color_palette.dart';
import 'package:google_fonts/google_fonts.dart';

final material3LightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.openSans().fontFamily,
  snackBarTheme: const SnackBarThemeData(),
  cardTheme: _AppCardTheme(cardColor: lightColorScheme.surface),
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: lightColorScheme.surfaceVariant,
);

final material3DarkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.openSans().fontFamily,
  snackBarTheme: const SnackBarThemeData(),
  cardTheme: _AppCardTheme(cardColor: darkColorScheme.surface),
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: darkColorScheme.surfaceVariant,
);

class _AppCardTheme extends CardTheme {
  final ShapeBorder? shapeBorder;
  final Color cardColor;

  const _AppCardTheme({
    this.shapeBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    required this.cardColor,
  }) : super(shape: shapeBorder, color: cardColor);
}
