import 'package:domain_entity/domain_entity.dart';

abstract class ThemeRepository {
  AppThemeMode getThemeMode();

  Future setThemeMode({required AppThemeMode themeMode});

  bool getIsDynamicEnabled();

  Future setIsDynamicEnabled({required bool isDynamic});
}
