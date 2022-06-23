import 'package:flutter_template/app.dart';
import 'package:foundation/foundation.dart';

void main() {
  FlavorConfig.initialize(
    flavor: Flavor.prod,
    values: const FlavorValues(
      apiBaseUrl: "https://api.openweathermap.org/",
      secrets: AppSecrets.appSecretsProd,
    ),
  );
  startApp();
}
