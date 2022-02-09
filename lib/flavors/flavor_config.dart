import 'package:flutter_template/flavors/flavor.dart';
import 'package:flutter_template/flavors/flavor_values.dart';

class FlavorConfig {
  final Flavor flavor;
  final FlavorValues values;

  static late FlavorConfig _instance;
  static var _initialized = false;

  factory FlavorConfig.initialize(
      {required Flavor flavor, required FlavorValues values}) {
    if (!_initialized) {
      _instance = FlavorConfig._internal(flavor: flavor, values: values);
      _initialized = true;
    }
    return _instance;
  }

  FlavorConfig._internal({
    required this.flavor,
    required this.values,
  });

  static FlavorConfig get instance => _instance;

  static bool isPROD() => _instance.flavor == Flavor.prod;

  static bool isQA() => _instance.flavor == Flavor.qa;

  static bool isDEV() => _instance.flavor == Flavor.dev;
}
