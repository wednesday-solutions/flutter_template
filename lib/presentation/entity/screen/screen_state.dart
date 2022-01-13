import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';

abstract class ScreenState {
  final UIToolbar toolbar;
  final bool showLoading;

  ScreenState({
    required this.toolbar,
    required this.showLoading,
  });
}
