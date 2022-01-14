import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/controller/base_controller.dart';
import 'package:flutter_template/presentation/base/controller/controller_extendsions.dart';
import 'package:flutter_template/presentation/base/widgets/observable/memoised_obx.dart';

class AppBarTitle<CONTROLLER extends BaseController> extends StatelessWidget {
  const AppBarTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MemoisedObx<String>(
      selector: (_) => context.controller().state.toolbar.title,
      child: (data) {
        return Text(data);
      },
    );
  }
}
