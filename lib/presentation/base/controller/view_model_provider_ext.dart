import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/controller/base_view_model.dart';
import 'package:flutter_template/presentation/base/widgets/controller/controller_key.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/entity/screen/screen_state.dart';

extension ViewModelProviderExt on BuildContext {
  AutoDisposeStateNotifierProvider<VIEW_MODEL, SCREEN_STATE> viewModelProvider<
      VIEW_MODEL extends BaseViewModel<Screen, SCREEN_STATE>,
      SCREEN_STATE extends ScreenState>() {
    return ViewModelProvider.of<VIEW_MODEL, SCREEN_STATE>(this).provider;
  }

  VIEW_MODEL viewModel<VIEW_MODEL extends BaseViewModel<Screen, SCREEN_STATE>,
      SCREEN_STATE extends ScreenState>(WidgetRef ref) {
    return ref.watch(viewModelProvider<VIEW_MODEL, SCREEN_STATE>().notifier);
  }
}
