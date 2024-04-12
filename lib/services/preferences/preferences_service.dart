abstract interface class PreferencesService {
  bool containsKey(String key);

  Future setInt({required String key, required int value});

  Future setBool({required String key, required bool value});

  Future setString({required String key, required String value});

  int getInt({required String key, required int defaultValue});

  bool getBool({required String key, required bool defaultValue});

  String getString({required String key, required String defaultValue});
}
