import 'package:flutter/material.dart';

TextTheme getTextTheme(ColorScheme colorScheme) {
  return TextTheme(
    displayLarge: TextStyle(
      fontSize: 96,
      fontWeight: FontWeight.w300,
      color: colorScheme.onPrimary,
    ),
    displayMedium: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.w300,
      color: colorScheme.onPrimary,
    ),
    displaySmall: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w400,
      color: colorScheme.onPrimary,
    ),
    headlineLarge: TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.w400,
      color: colorScheme.onPrimary,
    ),
    headlineMedium: TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w400,
      color: colorScheme.onPrimary,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: colorScheme.onPrimary,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: colorScheme.onPrimary,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: colorScheme.onPrimary,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: colorScheme.onPrimary,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: colorScheme.onPrimary,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: colorScheme.onPrimary,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: colorScheme.onPrimary,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: colorScheme.onPrimary,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: colorScheme.onPrimary,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: colorScheme.onPrimary,
    ),
  );
}
