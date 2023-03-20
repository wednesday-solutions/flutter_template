import 'package:flutter_template/flavors/flavor.dart';
import 'package:flutter_template/flavors/flavor_values.dart';

class FlavorConfig {
  final Flavor _flavor;
  final FlavorValues _values;

  static late FlavorConfig _instance;
  static var _initialized = false;

  factory FlavorConfig.initialize({required String flavorString}) {
    if (!_initialized) {
      final flavor = Flavor.fromString(flavor: flavorString);
      final values = FlavorValues.fromEnvironment();
      _instance = FlavorConfig._internal(flavor: flavor, values: values);
      _initialized = true;
    }
    return _instance;
  }

  FlavorConfig._internal({
    required Flavor flavor,
    required FlavorValues values,
  })  : _flavor = flavor,
        _values = values;

  static Flavor get flavor => _instance._flavor;

  static FlavorValues get values => _instance._values;

  static bool isPROD() => _instance._flavor == Flavor.prod;

  static bool isQA() => _instance._flavor == Flavor.qa;

  static bool isDEV() => _instance._flavor == Flavor.dev;
}
