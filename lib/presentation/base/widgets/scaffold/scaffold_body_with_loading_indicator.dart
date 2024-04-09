import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/view_model_provider/base_view_model.dart';
import 'package:flutter_template/presentation/base/view_model_provider/view_model_provider_ext.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/entity/screen/screen_state.dart';

class ScaffoldBodyWithLoadingIndicator<
    VIEW_MODEL extends BaseViewModel<Screen, SCREEN_STATE>,
    SCREEN_STATE extends ScreenState> extends ConsumerWidget {
  const ScaffoldBodyWithLoadingIndicator({
    super.key,
    required this.body,
    this.loading,
    this.hideDefaultLoading = false,
  });

  final Widget body;
  final Widget? loading;
  final bool hideDefaultLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelProvider =
        context.viewModelProvider<VIEW_MODEL, SCREEN_STATE>();
    final showLoading =
        ref.watch(viewModelProvider.select((state) => state.showLoading));
    return Center(
      child: Stack(alignment: AlignmentDirectional.center, children: [
        showLoading && !hideDefaultLoading
            ? loading ?? const CircularProgressIndicator()
            : const SizedBox(),
        body,
      ]),
    );
  }
}
