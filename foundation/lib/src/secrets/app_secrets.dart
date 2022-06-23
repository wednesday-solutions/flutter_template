class AppSecrets {
  final String openWeatherApiKey;

  const AppSecrets({
    required this.openWeatherApiKey,
  });

  static const appSecretsDev = AppSecrets(
    openWeatherApiKey: "77719ac9d5b2698cc2386cf0670a96ff",
  );

  static const appSecretsQA = AppSecrets(
    openWeatherApiKey: "77719ac9d5b2698cc2386cf0670a96ff",
  );

  static const appSecretsProd = AppSecrets(
    openWeatherApiKey: "77719ac9d5b2698cc2386cf0670a96ff",
  );
}
