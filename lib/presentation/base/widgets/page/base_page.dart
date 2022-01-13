import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/controller/base_controller.dart';
import 'package:flutter_template/presentation/base/widgets/appbar/app_bar_back_button.dart';
import 'package:flutter_template/presentation/base/widgets/appbar/app_bar_title.dart';
import 'package:flutter_template/presentation/base/widgets/scaffold/scaffold_body_with_loading_indicator.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/entity/screen/screen_state.dart';
import 'package:get/get.dart';

class BasePage<SCREEN extends Screen, SCREEN_STATE extends ScreenState,
        CONTROLLER extends BaseController<SCREEN, SCREEN_STATE>>
    extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;
  final Function()? onAppBarBackPressed;
  final List<Widget>? appBarActions;

  BasePage({
    Key? key,
    this.appBar,
    required this.body,
    this.onAppBarBackPressed,
    this.appBarActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CONTROLLER>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: AppBarBackButton(
            controller: controller,
            onBackPressed: onAppBarBackPressed ?? () {},
          ),
          title: AppBarTitle(
            controller: controller,
          ),
          actions: appBarActions,
        ),
        body: ScaffoldBodyWithLoadingIndicator(
          controller: controller,
          body: body,
        ),
      ),
    );
  }
}
