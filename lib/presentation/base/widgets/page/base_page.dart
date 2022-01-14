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
import 'package:flutter_template/presentation/weather/search/search_page.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

class BasePage<SCREEN extends Screen, SCREEN_STATE extends ScreenState,
        CONTROLLER extends BaseController<SCREEN, SCREEN_STATE>>
    extends StatelessWidget {
  final ControllerViewBuilder<CONTROLLER> body;
  final AppBar? appBar;
  final Function()? onAppBarBackPressed;
  final List<Widget>? appBarActions;
  final Widget? loading;

  BasePage(
      {Key? key,
      this.appBar,
      required this.body,
      this.onAppBarBackPressed,
      this.appBarActions,
      this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext _) {
    return ControllerKey(
      controllerKey: Uuid().v4(),
      child: Builder(
        builder: (context) {
          return GetBuilder<CONTROLLER>(
            tag: context.controllerKey(),
            init: GetIt.I.get<CONTROLLER>(),
            builder: (controller) {
              return _BasePageContent<CONTROLLER>(
                onAppBarBackPressed: onAppBarBackPressed,
                appBarActions: appBarActions,
                body: body,
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
  const _BasePageContent(
      {Key? key,
      required this.onAppBarBackPressed,
      required this.appBarActions,
      required this.body,
      this.loading})
      : super(key: key);

  final Function()? onAppBarBackPressed;
  final List<Widget>? appBarActions;
  final ControllerViewBuilder<CONTROLLER> body;
  final Widget? loading;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          leading: AppBarBackButton<CONTROLLER>(
            onBackPressed: onAppBarBackPressed ?? () {},
          ),
          title: AppBarTitle<CONTROLLER>(),
          actions: appBarActions,
        ),
        body: ScaffoldBodyWithLoadingIndicator(
          controller: context.controller<CONTROLLER>(),
          body: ControllerView<CONTROLLER>(body),
          loading: loading,
        ),
      ),
    );
  }
}
