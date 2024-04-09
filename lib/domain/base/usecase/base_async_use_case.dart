import 'package:flutter_template/domain/base/exception/unknown_object_thrown_exception.dart';
import 'package:flutter_template/core/entity/result.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';

abstract class BaseAsyncUseCase<IN, OUT> {
  Future<OUT> callInternal(IN param);

  Future<Result<OUT>> call({required IN param}) async {
    logD("call: param = $param");
    try {
      final result = await callInternal(param);
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
