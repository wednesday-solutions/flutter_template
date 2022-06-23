import 'package:presentation_entity/src/entity/base/ui_toolbar.dart';

abstract class ScreenState {
  UIToolbar get toolbar;
  bool get showLoading;
}
