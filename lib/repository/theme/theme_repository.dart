import 'package:flutter_template/domain/entity/theme/theme_mode.dart';

abstract class ThemeRepository {
  AppThemeMode getThemeMode();
  Future setThemeMode({required AppThemeMode themeMode});
  bool getIsDynamicEnabled();
  Future setIsDynamicEnabled({required bool isDynamic});
}
