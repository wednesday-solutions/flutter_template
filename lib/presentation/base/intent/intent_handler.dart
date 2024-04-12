import 'package:flutter_template/presentation/entity/intent/intent.dart';

abstract interface class IntentHandler<T extends BaseIntent> {
  void onIntent(T intent);
}
