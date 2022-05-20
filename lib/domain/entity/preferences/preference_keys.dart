enum PreferenceKeys {
  themeMode(key: "app_theme_mode"),
  isDynamicEnabled(key: "is_dynamic_enabled");

  final String key;

  const PreferenceKeys({required this.key});
}
