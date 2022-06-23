import 'package:presentation_entity/presentation_entity.dart';

abstract class IntentHandler<T extends BaseIntent> {
  void onIntent(T intent);
}
