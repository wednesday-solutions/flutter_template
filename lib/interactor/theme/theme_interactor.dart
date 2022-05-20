import 'package:flutter/material.dart';

abstract class ThemeInteractor {
  ThemeMode getThemeMode();
  Future setThemeMode(ThemeMode themeMode);
  bool getIsDynamicEnabled();
  Future setIsDynamicEnabled(bool isDynamicEnabled);
}
