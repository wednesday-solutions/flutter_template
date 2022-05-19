enum AppThemeMode {
  light(serializedValue: "theme_mode_light"),
  dark(serializedValue: "theme_mode_dark"),
  system(serializedValue: "theme_mode_system");

  final String serializedValue;
  const AppThemeMode({required this.serializedValue});
}
