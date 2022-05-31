import 'package:flutter_template/foundation/extensions/object_ext.dart';
import 'package:flutter_template/foundation/logger/logger.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseStreamUseCase<IN, OUT> {
  Stream<OUT> callInternal(IN param);

  void handleErrorInternal(dynamic error) {}

  Stream<OUT> call(IN param) {
    logD("call: param = $param");
    return callInternal(param)
        .doOnData((data) => logD("call: onEmit = $data"))
        .handleError((error) {
      log.e("BaseStreamUseCase: Error [$error] of type [${error.runtimeType}]");
      return handleErrorInternal(error);
    });
  }
}
