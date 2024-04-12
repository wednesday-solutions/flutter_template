import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/entity/intent/intent.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

sealed class ThemeIntent implements BaseIntent {
  const ThemeIntent();
}

class SetThemeModeThemeIntent extends ThemeIntent {
  final ThemeMode mode;

  const SetThemeModeThemeIntent({required this.mode});
}

class SetIsDynamicThemeIntent extends ThemeIntent {
  final bool isDynamic;

  const SetIsDynamicThemeIntent({required this.isDynamic});
}


