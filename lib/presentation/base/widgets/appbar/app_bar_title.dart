import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/foundation/extensions/context_ext.dart';
import 'package:flutter_template/presentation/base/view_model_provider/base_view_model.dart';
import 'package:flutter_template/presentation/base/view_model_provider/view_model_provider_ext.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/entity/screen/screen_state.dart';

class AppBarTitle<VIEW_MODEL extends BaseViewModel<Screen, SCREEN_STATE>,
    SCREEN_STATE extends ScreenState> extends ConsumerWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(
      context
          .viewModelProvider<VIEW_MODEL, SCREEN_STATE>()
          .select((state) => state.toolbar.title),
    );
    return Text(
      context.tr(title),
      overflow: TextOverflow.ellipsis,
    );
  }
}
