import 'package:flutter_template/navigation/base/base_navigator.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:get/get.dart';

class BaseNavigatorImpl implements BaseNavigator {
  @override
  void back() {
    Get.back(closeOverlays: true);
  }

  @override
  void to(Screen screen) {
    Get.toNamed(
      screen.path,
      arguments: screen,
    );
  }
}
