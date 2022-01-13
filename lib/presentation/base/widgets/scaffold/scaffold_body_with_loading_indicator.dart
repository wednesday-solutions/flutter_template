import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/controller/base_controller.dart';

class ScaffoldBodyWithLoadingIndicator extends StatelessWidget {
  const ScaffoldBodyWithLoadingIndicator({
    Key? key,
    required this.controller,
    required this.body,
  }) : super(key: key);

  final BaseController controller;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      if (controller.state.showLoading) CircularProgressIndicator(),
      body,
    ]);
  }
}
