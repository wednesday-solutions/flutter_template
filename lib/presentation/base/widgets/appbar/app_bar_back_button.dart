import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/controller/base_controller.dart';
import 'package:flutter_template/presentation/base/widgets/observable/memoised_obx.dart';

class AppBarBackButton extends StatelessWidget {
  final BaseController controller;
  final Function() onBackPressed;

  const AppBarBackButton({
    Key? key,
    required this.controller,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MemoisedObx<bool>(
      selector: (context) => controller.state.toolbar.hasBackButton,
      child: (hasBackButton) => hasBackButton
          ? IconButton(
              onPressed: onBackPressed,
              icon: Icon(Icons.arrow_back),
            )
          : SizedBox(),
    );
  }
}
