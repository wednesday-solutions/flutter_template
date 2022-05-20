import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/entity/intent/intent.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_intent.freezed.dart';

@freezed
class ThemeIntent with _$ThemeIntent implements BaseIntent {
  factory ThemeIntent.setThemeMode(ThemeMode mode) = _ThemeIntent_SetThemeMode;
  factory ThemeIntent.setIsDynamic(bool isDynamic) = _ThemeIntent_SetIsDynamic;
}
