import 'package:flutter_template/foundation/logger/logger.dart';

abstract class BaseStreamUseCase<IN, OUT> {
  Stream<OUT> callInternal(IN param);

  void handleErrorInternal(dynamic error) {}

  Stream<OUT> call(IN param) {
    return callInternal(param).handleError((error) {
      log.e("BaseStreamUseCase: Error [$error] of type [${error.runtimeType}]");
      return handleErrorInternal(error);
    });
  }
}
