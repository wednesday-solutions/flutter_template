import 'package:flutter_template/presentation/entity/intent/intent.dart';

typedef IntentHandlerCallback<T extends BaseIntent> = void Function(T intent);
