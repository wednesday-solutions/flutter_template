import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/foundation/extensions/theme_ext.dart';
import 'package:flutter_template/presentation/base/view_model_provider/base_view_model.dart';
import 'package:flutter_template/presentation/base/view_model_provider/view_model_provider.dart';
import 'package:flutter_template/presentation/base/view_model_provider/view_model_provider_ext.dart';
import 'package:flutter_template/presentation/base/widgets/appbar/app_bar_back_button.dart';
import 'package:flutter_template/presentation/base/widgets/appbar/app_bar_title.dart';
import 'package:flutter_template/presentation/base/widgets/scaffold/scaffold_body_with_loading_indicator.dart';
import 'package:flutter_template/presentation/entity/effect/effect.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/entity/screen/screen_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BasePage<SCREEN extends Screen, SCREEN_STATE extends ScreenState,
        VIEW_MODEL extends BaseViewModel<SCREEN, SCREEN_STATE>>
    extends HookConsumerWidget {
  final Widget body;
  final AutoDisposeStateNotifierProvider<VIEW_MODEL, SCREEN_STATE>
      viewModelProvider;
  final SCREEN? screen;
  final AppBar? appBar;
  final Function(VIEW_MODEL viewModel)? onAppBarBackPressed;
  final List<Widget> Function()? appBarActions;
  final Widget? loading;
  final bool hideDefaultLoading;
  final Function(Effect effect) onEffect;

  const BasePage({
    Key? key,
    this.appBar,
    required this.viewModelProvider,
    this.screen,
    required this.body,
    this.onAppBarBackPressed,
    this.appBarActions,
    this.loading,
    this.hideDefaultLoading = false,
    this.onEffect = noopEffectHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(viewModelProvider.notifier);

    viewModel.bind(screen);

    useEffect(() {
      final subscription = viewModel.effectStream.listen((effect) {
        if (effect != null) {
          onEffect(effect);
        }
      });

      return subscription.cancel;
    }, [viewModel.effectStream]);

    return ViewModelProvider(
      provider: viewModelProvider,
      child: _BasePageContent<VIEW_MODEL, SCREEN_STATE>(
        onAppBarBackPressed: onAppBarBackPressed,
        appBarActions: appBarActions?.call(),
        body: body,
        hideDefaultLoading: hideDefaultLoading,
        loading: loading,
      ),
    );
  }
}

class _BasePageContent<VIEW_MODEL extends BaseViewModel<Screen, SCREEN_STATE>,
    SCREEN_STATE extends ScreenState> extends ConsumerWidget {
  final bool hideDefaultLoading;
  final Function(VIEW_MODEL controller)? onAppBarBackPressed;
  final List<Widget>? appBarActions;
  final Widget body;
  final Widget? loading;

  const _BasePageContent({
    Key? key,
    required this.onAppBarBackPressed,
    required this.appBarActions,
    required this.body,
    required this.loading,
    required this.hideDefaultLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasBackButton = ref.watch(
      context
          .viewModelProvider<VIEW_MODEL, SCREEN_STATE>()
          .select((state) => state.toolbar.hasBackButton),
    );
    return Container(
      color: context.theme.primaryColorDark,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            leading: hasBackButton
                ? AppBarBackButton<VIEW_MODEL, SCREEN_STATE>(
                    onBackPressed: () {
                      onAppBarBackPressed?.call(
                          context.viewModel<VIEW_MODEL, SCREEN_STATE>(ref));
                    },
                  )
                : null,
            title: AppBarTitle<VIEW_MODEL, SCREEN_STATE>(),
            actions: appBarActions,
          ),
          body: ScaffoldBodyWithLoadingIndicator<VIEW_MODEL, SCREEN_STATE>(
            body: body,
            hideDefaultLoading: hideDefaultLoading,
            loading: loading,
          ),
        ),
      ),
    );
  }
}

noopEffectHandler(Effect effect) {}
