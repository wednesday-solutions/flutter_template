import 'package:collection/collection.dart';
import 'package:flutter_template/foundation/logger/logger.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/entity/screen/screen_state.dart';
import 'package:get/get.dart';

abstract class BaseController<SCREEN extends Screen,
    SCREEN_STATE extends ScreenState> extends GetxController {
  late Rx<SCREEN_STATE> _state;
  Rx<SCREEN_STATE> get rxState => _state;
  SCREEN_STATE get state => _state.value;

  SCREEN_STATE getDefaultState();

  final SCREEN? screen = Get.arguments as SCREEN?;

  @override
  void onInit() {
    super.onInit();
    log.e("path on init ${screen?.path}");
    _state = getDefaultState().obs;
  }

  @override
  void onReady() {
    log.e("path on ready ${screen?.path}");
  }

  @override
  void onClose() {
    log.e("path on close ${screen?.path}");
    super.onClose();
  }

  setState(SCREEN_STATE Function(SCREEN_STATE state) reducer) {
    final newState = reducer(state);
    if (!DeepCollectionEquality().equals(_state.value, newState)) {
      _state.value = newState;
    }
  }
}
