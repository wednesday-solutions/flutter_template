import 'package:flutter_template/app.dart';
import 'package:flutter_template/flavors/flavor.dart';
import 'package:flutter_template/flavors/flavor_config.dart';
import 'package:flutter_template/flavors/flavor_values.dart';
import 'package:flutter_template/secrets/app_secrets.dart';

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
