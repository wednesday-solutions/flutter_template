abstract interface class PreferencesRepository {
  bool contains({required String key});

  int getInt({required String key, required int defaultValue});

  bool getBool({required String key, required bool defaultValue});

  String getString({required String key, required String defaultValue});

  Future save<T>({required String key, required T value});
}
