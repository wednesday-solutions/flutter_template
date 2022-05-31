import 'package:flutter_template/foundation/extensions/object_ext.dart';
import 'package:flutter_template/repository/preferences/preferences_repository.dart';
import 'package:flutter_template/services/preferences/preferences_service.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final PreferencesService preferencesService;

  PreferencesRepositoryImpl({required this.preferencesService});

  @override
  bool contains({required String key}) {
    logD("contains: key = $key");
    return preferencesService.containsKey(key);
  }

  @override
  bool getBool({required String key, required bool defaultValue}) {
    logD("getBool: key = $key, defaultValue = $defaultValue");
    return preferencesService.getBool(key: key, defaultValue: defaultValue);
  }

  @override
  int getInt({required String key, required int defaultValue}) {
    logD("getInt: key = $key, defaultValue = $defaultValue");
    return preferencesService.getInt(key: key, defaultValue: defaultValue);
  }

  @override
  String getString({required String key, required String defaultValue}) {
    logD("getString: key = $key, defaultValue = $defaultValue");
    return preferencesService.getString(key: key, defaultValue: defaultValue);
  }

  @override
  Future save<T>({required String key, required T value}) async {
    logD("save: key = $key, value = $value");
    if (value is bool) {
      return await preferencesService.setBool(key: key, value: value);
    }
    if (value is int) {
      return await preferencesService.setInt(key: key, value: value);
    }
    if (value is String) {
      return await preferencesService.setString(key: key, value: value);
    }
    throw ArgumentError.value(
        value, null, "Cannot save type ${value.runtimeType} to preferences.");
  }
}
