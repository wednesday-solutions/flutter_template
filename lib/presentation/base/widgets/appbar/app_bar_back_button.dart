import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/controller/base_controller.dart';
import 'package:flutter_template/presentation/base/controller/controller_extendsions.dart';
import 'package:flutter_template/presentation/base/widgets/observable/memoised_obx.dart';

class AppBarBackButton<CONTROLLER extends BaseController>
    extends StatelessWidget {
  final Function() onBackPressed;

  const AppBarBackButton({
    Key? key,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MemoisedObx<bool>(
      selector: (context) =>
          context.controller<CONTROLLER>().state.toolbar.hasBackButton,
      child: (hasBackButton) => hasBackButton
          ? IconButton(
              onPressed: onBackPressed,
              icon: Icon(Icons.arrow_back),
            )
          : SizedBox(),
    );
  }
}
