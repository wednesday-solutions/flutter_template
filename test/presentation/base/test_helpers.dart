import 'package:flutter_template/flavors/flavor.dart';
import 'package:flutter_template/flavors/flavor_config.dart';
import 'package:flutter_template/flavors/flavor_values.dart';

void baseSetupAll() {
  FlavorConfig.initialize(
    flavor: Flavor.dev,
    values: const FlavorValues(apiBaseUrl: ""),
  );
}
