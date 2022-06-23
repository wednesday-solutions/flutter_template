import 'package:foundation/foundation.dart';

abstract class BaseUnsafeUseCase<IN, OUT> {
  OUT callInternal(IN param);

  OUT call(IN param) {
    logD("call: param = $param");
    return callInternal(param);
  }
}
