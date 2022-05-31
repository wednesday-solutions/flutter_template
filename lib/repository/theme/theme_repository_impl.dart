import 'package:flutter_template/domain/entity/preferences/preference_keys.dart';
import 'package:flutter_template/domain/entity/theme/theme_mode.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';
import 'package:flutter_template/repository/preferences/preferences_repository.dart';
import 'package:flutter_template/repository/theme/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final PreferencesRepository preferencesRepo;

  ThemeRepositoryImpl({required this.preferencesRepo});

  @override
  AppThemeMode getThemeMode() {
    logD("getThemeMode");
    final themeMode = preferencesRepo.getString(
      key: PreferenceKeys.themeMode.key,
      defaultValue: AppThemeMode.system.serializedValue,
    );
    return AppThemeMode.values.firstWhere(
      (mode) => mode.serializedValue == themeMode,
    );
  }

  @override
  Future setThemeMode({required AppThemeMode themeMode}) async {
    logD("setThemeMode: themeMode = $themeMode");
    return await preferencesRepo.save(
      key: PreferenceKeys.themeMode.key,
      value: themeMode.serializedValue,
    );
  }

  @override
  bool getIsDynamicEnabled() {
    logD("getIsDynamicEnabled");
    return preferencesRepo.getBool(
      key: PreferenceKeys.isDynamicEnabled.key,
      defaultValue: true,
    );
  }

  @override
  Future setIsDynamicEnabled({required bool isDynamic}) {
    logD("setIsDynamicEnabled: isDynamic = $isDynamic");
    return preferencesRepo.save(
      key: PreferenceKeys.isDynamicEnabled.key,
      value: isDynamic,
    );
  }
}
