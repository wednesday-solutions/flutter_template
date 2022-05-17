import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/theme/color_palette.dart';
import 'package:google_fonts/google_fonts.dart';

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
  colorScheme: ColorScheme(
    background: lightColorScheme.background,
    onBackground: lightColorScheme.onBackground,
    error: lightColorScheme.error,
    onError: lightColorScheme.onError,
    onPrimary: lightColorScheme.onPrimary,
    onSecondary: lightColorScheme.onSecondary,
    onSurface: lightColorScheme.onSurface,
    primary: lightColorScheme.primary,
    secondary: lightColorScheme.secondary,
    surface: lightColorScheme.surface,
    brightness: Brightness.light,
  ),
);

final m3Dark = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.signika().fontFamily,
  snackBarTheme: const SnackBarThemeData(),
  cardTheme: const _AppCardTheme(),
  colorScheme: ColorScheme(
    background: darkColorScheme.background,
    onBackground: darkColorScheme.onBackground,
    error: darkColorScheme.error,
    onError: darkColorScheme.onError,
    onPrimary: darkColorScheme.onPrimary,
    onSecondary: darkColorScheme.onSecondary,
    onSurface: darkColorScheme.onSurface,
    primary: darkColorScheme.primary,
    secondary: darkColorScheme.secondary,
    surface: darkColorScheme.surface,
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
