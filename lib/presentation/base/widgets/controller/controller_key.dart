import 'package:flutter/material.dart';

class ControllerKey extends InheritedWidget {
  @override
  final Widget child;
  final String? controllerKey;

  const ControllerKey({
    required this.child,
    required this.controllerKey,
  }) : super(child: child);

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
