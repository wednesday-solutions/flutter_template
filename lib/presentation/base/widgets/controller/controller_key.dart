import 'package:flutter/material.dart';

class ControllerKey extends InheritedWidget {
  final String? controllerKey;

  const ControllerKey({
    Key? key,
    required Widget child,
    required this.controllerKey,
  }) : super(key: key, child: child);

  static ControllerKey of(BuildContext context) {
    final ControllerKey? result =
        context.dependOnInheritedWidgetOfExactType<ControllerKey>();
    assert(result != null, 'No ControllerKey found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant ControllerKey oldWidget) {
    return oldWidget.controllerKey != controllerKey;
  }
}
