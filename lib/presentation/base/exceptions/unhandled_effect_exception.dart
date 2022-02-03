import 'package:flutter_template/presentation/entity/effect/effect.dart';

class UnhandledEffectException implements Exception {
  final Effect effect;

  UnhandledEffectException(this.effect);

  @override
  String toString() {
    return "Effect ${effect.runtimeType} is not handled.";
  }
}
