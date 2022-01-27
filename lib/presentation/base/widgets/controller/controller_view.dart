import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/controller/base_controller.dart';
import 'package:flutter_template/presentation/base/controller/controller_extendsions.dart';

typedef ControllerViewBuilder<CONTROLLER extends BaseController> = Widget
    Function(BuildContext context, CONTROLLER controller);

class ControllerView<CONTROLLER extends BaseController> extends Widget {
  final ControllerViewBuilder<CONTROLLER> builder;

  const ControllerView({Key? key, required this.builder}): super(key: key);

  @override
  ControllerBuilderElement createElement() =>
      ControllerBuilderElement<CONTROLLER>(this);
}

class ControllerBuilderElement<CONTROLLER extends BaseController>
    extends ComponentElement {
  ControllerBuilderElement(ControllerView widget) : super(widget);

  @override
  ControllerView<CONTROLLER> get widget =>
      super.widget as ControllerView<CONTROLLER>;

  @override
  Widget build() {
    return widget.builder(this, controller<CONTROLLER>());
  }
}
