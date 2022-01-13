import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/controller/base_controller.dart';
import 'package:flutter_template/presentation/base/widgets/observable/memoised_obx.dart';

class AppBarTitle extends StatelessWidget {
  final BaseController controller;

  const AppBarTitle({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MemoisedObx<String>(
      selector: (_) => controller.state.toolbar.title,
      child: (data) {
        return Text(data);
      },
    );
  }
}
