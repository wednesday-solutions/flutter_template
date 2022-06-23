import 'package:foundation/foundation.dart';

abstract class BaseUseCase<IN, OUT> {
  OUT callInternal(IN param);

  Result<OUT> call(IN param) {
    logD("call = $param");
    try {
      final result = callInternal(param);
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
