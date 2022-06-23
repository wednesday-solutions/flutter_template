import 'package:foundation/foundation.dart';

void baseSetupAll() {
  FlavorConfig.initialize(
    flavor: Flavor.dev,
    values: const FlavorValues(
        apiBaseUrl: "",
        secrets: AppSecrets(
          openWeatherApiKey: "openWeatherApiKey",
        )),
  );
}
