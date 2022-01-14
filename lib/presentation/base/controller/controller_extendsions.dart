import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/controller/base_controller.dart';
import 'package:flutter_template/presentation/base/widgets/controller/controller_key.dart';
import 'package:get/get.dart';

extension ControllerKeyAccessor on BuildContext {
  String? controllerKey() {
    return ControllerKey.of(this).controllerKey;
  }
}

extension ControllerAccessor on BuildContext {
  T controller<T extends BaseController>() {
    return Get.find<T>(tag: controllerKey());
  }
}
