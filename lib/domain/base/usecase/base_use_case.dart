import 'package:flutter_template/domain/base/exception/unknown_object_thrown_exception.dart';
import 'package:flutter_template/core/entity/result.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';

abstract class BaseUseCase<IN, OUT> {
  OUT callInternal(IN param);

  Result<OUT> call(IN param) {
    logD("call = $param");
    try {
      final result = callInternal(param);
      return Success(data: result);
    } catch (error) {
      final Exception exception;

      if (error is Exception) {
        exception = error;
      } else {
        exception = UnknownObjectThrownException(object: error);
      }
      return Error(exception: exception);
    }
  }
}
