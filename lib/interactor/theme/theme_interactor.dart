import 'package:flutter/material.dart';

abstract interface class ThemeInteractor {
  ThemeMode getThemeMode();
  Future setThemeMode(ThemeMode themeMode);
  bool getIsDynamicEnabled();
  Future setIsDynamicEnabled(bool isDynamicEnabled);
}
