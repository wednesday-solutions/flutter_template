import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class MemoisedObx<T> extends StatefulWidget {
  final Widget Function(T data) child;
  final T Function(BuildContext context) selector;
  const MemoisedObx({
    Key? key,
    required this.selector,
    required this.child,
  }) : super(key: key);

  @override
  _MemoisedObxState createState() => _MemoisedObxState<T>();
}

class _MemoisedObxState<T> extends State<MemoisedObx<T>> {
  Widget? _child;
  Widget? _oldWidget;
  T? _oldState;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final newState = widget.selector(context);
        if ((_oldWidget != widget) ||
            !DeepCollectionEquality().equals(_oldState, newState)) {
          _oldState = newState;
          _oldWidget = widget;
          _child = widget.child(newState);
        }
        return _child!;
      },
    );
  }
}
