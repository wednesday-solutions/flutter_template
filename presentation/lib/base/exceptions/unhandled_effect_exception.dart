import 'package:presentation_entity/presentation_entity.dart';

class UnhandledEffectException implements Exception {
  final Effect effect;

  UnhandledEffectException(this.effect);

  @override
  String toString() {
    return "Effect ${effect.runtimeType} is not handled.";
  }
}
