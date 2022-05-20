import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/theme/color/color_palette.dart';
import 'package:flutter_template/presentation/base/theme/theme_data/card_theme_data.dart';
import 'package:flutter_template/presentation/base/theme/type/type.dart';

final material3LightTheme = buildTheme(lightColorScheme);

final material3DarkTheme = buildTheme(darkColorScheme);

ThemeData buildTheme(ColorScheme colorScheme) {
  return ThemeData(
    useMaterial3: true,
    fontFamily: primaryFontFamily,
    popupMenuTheme: PopupMenuThemeData(color: colorScheme.primaryContainer),
    cardTheme: AppCardTheme(cardColor: colorScheme.primaryContainer),
    snackBarTheme: SnackBarThemeData(backgroundColor: colorScheme.surface),
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.surfaceVariant,
  );
}
