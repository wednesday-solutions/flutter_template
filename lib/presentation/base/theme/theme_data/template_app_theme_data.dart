import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/theme/color/color_palette.dart';
import 'package:flutter_template/presentation/base/theme/theme_data/card_theme_data.dart';
import 'package:google_fonts/google_fonts.dart';

final material3LightTheme = buildTheme(lightColorScheme);

final material3DarkTheme = buildTheme(darkColorScheme);

ThemeData buildTheme(ColorScheme colorScheme) {
  return ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.openSansTextTheme(),
    fontFamily: GoogleFonts.openSans().fontFamily,
    popupMenuTheme: PopupMenuThemeData(color: colorScheme.surface),
    cardTheme: AppCardTheme(cardColor: colorScheme.surface),
    snackBarTheme: SnackBarThemeData(backgroundColor: colorScheme.surface),
    appBarTheme: AppBarTheme(color: colorScheme.surfaceVariant),
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.background,
  );
}
