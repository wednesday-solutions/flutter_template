import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/view_model_provider/base_view_model.dart';
import 'package:flutter_template/presentation/base/view_model_provider/view_model_provider_ext.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/entity/screen/screen_state.dart';

class AppBarBackButton<VIEW_MODEL extends BaseViewModel<Screen, SCREEN_STATE>,
    SCREEN_STATE extends ScreenState> extends ConsumerWidget {
  final Function() onBackPressed;

  const AppBarBackButton({
    Key? key,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasBackButton = ref.watch(
      context
          .viewModelProvider<VIEW_MODEL, SCREEN_STATE>()
          .select((state) => state.toolbar.hasBackButton),
    );
    return hasBackButton
        ? IconButton(
            tooltip: "Back",
            onPressed: onBackPressed,
            icon: const Icon(Icons.arrow_back),
          )
        : const SizedBox(
            width: 0,
            height: 0,
          );
  }
}
