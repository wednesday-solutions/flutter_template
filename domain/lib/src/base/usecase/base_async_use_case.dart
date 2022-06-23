import 'package:foundation/foundation.dart';

abstract class BaseAsyncUseCase<IN, OUT> {
  Future<OUT> callInternal(IN param);

  Future<Result<OUT>> call({required IN param}) async {
    logD("call: param = $param");
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
