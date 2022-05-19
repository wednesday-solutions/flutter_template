import 'package:flutter_template/repository/preferences/preferences_repository.dart';
import 'package:flutter_template/services/preferences/preferences_service.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final PreferencesService preferencesService;

  PreferencesRepositoryImpl({required this.preferencesService});

  @override
  bool contains({required String key}) => preferencesService.containsKey(key);

  @override
  bool getBool({required String key, required bool defaultValue}) =>
      preferencesService.getBool(key: key, defaultValue: defaultValue);

  @override
  int getInt({required String key, required int defaultValue}) =>
      preferencesService.getInt(key: key, defaultValue: defaultValue);

  @override
  String getString({required String key, required String defaultValue}) =>
      preferencesService.getString(key: key, defaultValue: defaultValue);

  @override
  Future save<T>({required String key, required T value}) async {
    if (value is bool) {
      return await preferencesService.setBool(key: key, value: value);
    }
    if (value is int) {
      return await preferencesService.setInt(key: key, value: value);
    }
    if (value is String) {
      return await preferencesService.setString(key: key, value: value);
    }
    throw ArgumentError.value(value, null, "Cannot save type ${value.runtimeType} to preferences.");
  }
}
