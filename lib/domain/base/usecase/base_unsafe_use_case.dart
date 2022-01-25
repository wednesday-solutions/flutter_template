abstract class BaseUnsafeUseCase<IN, OUT> {
  OUT callInternal(IN param);

  OUT call(IN param) {
    return callInternal(param);
  }
}
