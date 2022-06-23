import 'package:domain_entity/domain_entity.dart';
import 'package:foundation/foundation.dart';
import 'package:repository/interface/preferences/preferences_repository.dart';
import 'package:repository/interface/theme/theme_repository.dart';

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
