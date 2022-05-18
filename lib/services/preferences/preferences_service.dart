abstract class PreferencesService {
  Future setInt({required String key, required int value});

  Future setBool({required String key, required bool value});

  Future setString({required String key, required String value});

  int? getInt({required String key, int? defaultValue});

  bool? getBool({required String key, bool? defaultValue});

  String? getString({required String key, String? defaultValue});
}
