import 'package:flutter_template/foundation/extensions/object_ext.dart';
import 'package:flutter_template/services/preferences/preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServiceImpl implements PreferencesService {
  final SharedPreferences sharedPreferences;

  PreferencesServiceImpl({required this.sharedPreferences});

  @override
  Future setBool({required String key, required bool value}) {
    logD("setBool: key = $key, value = $value");
    return sharedPreferences.setBool(key, value);
  }

  @override
  Future setInt({required String key, required int value}) {
    logD("setInt: key = $key, value = $value");
    return sharedPreferences.setInt(key, value);
  }

  @override
  Future setString({required String key, required String value}) {
    logD("setString: key = $key, value = $value");
    return sharedPreferences.setString(key, value);
  }

  @override
  bool getBool({required String key, required bool defaultValue}) {
    logD("getBool: key = $key, defaultValue = $defaultValue");
    return sharedPreferences.getBool(key) ?? defaultValue;
  }

  @override
  int getInt({required String key, required int defaultValue}) {
    logD("getInt: key = $key, defaultValue = $defaultValue");
    return sharedPreferences.getInt(key) ?? defaultValue;
  }

  @override
  String getString({required String key, required String defaultValue}) {
    logD("getString: key = $key, defaultValue = $defaultValue");
    return sharedPreferences.getString(key) ?? defaultValue;
  }

  @override
  bool containsKey(String key) {
    logD("containsKey: key = $key");
    return sharedPreferences.containsKey(key);
  }
}
