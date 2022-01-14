import 'package:flutter_template/presentation/entity/intent/intent.dart';

abstract class IntentHandler<T extends Intent> {
  void onIntent(T intent);
}
