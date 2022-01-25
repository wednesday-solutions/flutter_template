import 'package:flutter_template/domain/base/exception/unknown_object_thrown_exception.dart';
import 'package:flutter_template/domain/entity/base/result/result.dart';

abstract class BaseAsyncUseCase<IN, OUT> {
  Future<OUT> callInternal(IN param);

  Future<Result<OUT>> call({required IN param}) async {
    try {
      final result = await callInternal(param);
      return Result.success(result);
    } catch (error) {
      final Exception exception;

      if (error is Exception) {
        exception = error;
      } else {
        exception = UnknownObjectThrownException(object: error);
      }
      return Result.error(exception);
    }
  }
}
