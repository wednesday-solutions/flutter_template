import 'package:flutter_template/services/preferences/preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServiceImpl implements PreferencesService {
  final SharedPreferences sharedPreferences;

  PreferencesServiceImpl({required this.sharedPreferences});

  @override
  Future setBool({required String key, required bool value}) =>
      sharedPreferences.setBool(key, value);

  @override
  Future setInt({required String key, required int value}) => sharedPreferences.setInt(key, value);

  @override
  Future setString({required String key, required String value}) =>
      sharedPreferences.setString(key, value);

  @override
  bool? getBool({required String key, bool? defaultValue}) =>
      sharedPreferences.getBool(key) ?? defaultValue;

  @override
  int? getInt({required String key, int? defaultValue}) =>
      sharedPreferences.getInt(key) ?? defaultValue;

  @override
  String? getString({required String key, String? defaultValue}) =>
      sharedPreferences.getString(key) ?? defaultValue;
}
