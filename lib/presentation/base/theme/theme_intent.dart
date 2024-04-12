import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/entity/intent/intent.dart';

sealed class ThemeIntent extends BaseIntent {
  const ThemeIntent();
}

class SetThemeModeThemeIntent extends ThemeIntent {
  final ThemeMode mode;

  const SetThemeModeThemeIntent({required this.mode});

  @override
  List<Object?> get props => [mode];
}

class SetIsDynamicThemeIntent extends ThemeIntent {
  final bool isDynamic;

  const SetIsDynamicThemeIntent({required this.isDynamic});

  @override
  List<Object?> get props => [isDynamic];
}
