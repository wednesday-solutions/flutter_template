import 'package:presentation_entity/presentation_entity.dart';

typedef IntentHandlerCallback<T extends BaseIntent> = void Function(T intent);
