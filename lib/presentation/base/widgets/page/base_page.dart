import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/controller/base_controller.dart';
import 'package:flutter_template/presentation/base/controller/controller_extendsions.dart';
import 'package:flutter_template/presentation/base/widgets/appbar/app_bar_back_button.dart';
import 'package:flutter_template/presentation/base/widgets/appbar/app_bar_title.dart';
import 'package:flutter_template/presentation/base/widgets/controller/controller_key.dart';
import 'package:flutter_template/presentation/base/widgets/controller/controller_view.dart';
import 'package:flutter_template/presentation/base/widgets/scaffold/scaffold_body_with_loading_indicator.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/entity/screen/screen_state.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

class BasePage<SCREEN extends Screen, SCREEN_STATE extends ScreenState,
        CONTROLLER extends BaseController<SCREEN, SCREEN_STATE>>
    extends StatelessWidget {
  final ControllerViewBuilder<CONTROLLER> body;
  final AppBar? appBar;
  final Function(CONTROLLER controller)? onAppBarBackPressed;
  final List<Widget> Function(CONTROLLER controller)? appBarActions;
  final Widget? loading;
  final bool hideDefaultLoading;
  final bool tagController;

  const BasePage({
    Key? key,
    this.appBar,
    required this.body,
    this.onAppBarBackPressed,
    this.appBarActions,
    this.loading,
    this.hideDefaultLoading = false,
    this.tagController = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ControllerKey(
      controllerKey: tagController ? const Uuid().v4() : null,
      child: Builder(
        builder: (context) {
          return GetBuilder<CONTROLLER>(
            tag: context.controllerKey(),
            init: GetIt.I.get<CONTROLLER>(),
            builder: (controller) {
              return _BasePageContent<CONTROLLER>(
                onAppBarBackPressed: onAppBarBackPressed,
                appBarActions: appBarActions?.call(controller),
                body: body,
                hideDefaultLoading: hideDefaultLoading,
                loading: loading,
              );
            },
          );
        },
      ),
    );
  }
}

class _BasePageContent<CONTROLLER extends BaseController>
    extends StatelessWidget {
  final bool hideDefaultLoading;
  final Function(CONTROLLER controller)? onAppBarBackPressed;
  final List<Widget>? appBarActions;
  final ControllerViewBuilder<CONTROLLER> body;
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          leading: context.controller<CONTROLLER>().state.toolbar.hasBackButton
              ? AppBarBackButton<CONTROLLER>(
                  onBackPressed: () {
                    onAppBarBackPressed?.call(context.controller<CONTROLLER>());
                  },
                )
              : null,
          title: AppBarTitle<CONTROLLER>(),
          actions: appBarActions,
        ),
        body: ScaffoldBodyWithLoadingIndicator<CONTROLLER>(
          body: ControllerView<CONTROLLER>(builder: body),
          hideDefaultLoading: hideDefaultLoading,
          loading: loading,
        ),
      ),
    );
  }
}