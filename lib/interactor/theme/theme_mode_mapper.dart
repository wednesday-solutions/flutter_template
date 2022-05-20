import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entity/theme/theme_mode.dart';
import 'package:flutter_template/foundation/mapper/mapper.dart';

abstract class ThemeModeMapper extends Mapper<AppThemeMode, ThemeMode> {
  AppThemeMode mapThemeMode(ThemeMode from);
}

class ThemeModeMapperImpl extends ThemeModeMapper {
  @override
  ThemeMode map(AppThemeMode from) {
    switch (from) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }

  @override
  AppThemeMode mapThemeMode(ThemeMode from) {
    switch (from) {
      case ThemeMode.system:
        return AppThemeMode.system;
      case ThemeMode.light:
        return AppThemeMode.light;
      case ThemeMode.dark:
        return AppThemeMode.dark;
    }
  }
}
