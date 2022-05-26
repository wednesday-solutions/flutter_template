import 'package:flutter_template/foundation/extensions/object_ext.dart';

abstract class BaseUnsafeUseCase<IN, OUT> {
  OUT callInternal(IN param);

  OUT call(IN param) {
    logD("call: param = $param");
    return callInternal(param);
  }
}
