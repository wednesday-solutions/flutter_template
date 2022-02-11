import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/view_model_provider/base_view_model.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/entity/screen/screen_state.dart';

class ViewModelProvider<VIEW_MODEL extends BaseViewModel<Screen, SCREEN_STATE>,
    SCREEN_STATE extends ScreenState> extends InheritedWidget {
  final AutoDisposeStateNotifierProvider<VIEW_MODEL, SCREEN_STATE> provider;

  const ViewModelProvider({
    Key? key,
    required Widget child,
    required this.provider,
  }) : super(key: key, child: child);

  static ViewModelProvider<VIEW_MODEL, SCREEN_STATE> of<
      VIEW_MODEL extends BaseViewModel<Screen, SCREEN_STATE>,
      SCREEN_STATE extends ScreenState>(BuildContext context) {
    final ViewModelProvider<VIEW_MODEL, SCREEN_STATE>? result =
        context.dependOnInheritedWidgetOfExactType<
            ViewModelProvider<VIEW_MODEL, SCREEN_STATE>>();
    assert(result != null,
        'No View Model Provider of type $VIEW_MODEL found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant ViewModelProvider oldWidget) {
    return oldWidget.provider != provider;
  }
}
