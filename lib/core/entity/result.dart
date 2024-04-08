import 'package:equatable/equatable.dart';

sealed class Result<T> extends Equatable {
  const Result();

  R when<R>({
    required R Function(T) success,
    required R Function(Exception?) error,
  }) {
    switch (this) {
      case Success<T>():
        return success((this as Success<T>).data);
      case Error<Exception>():
        return error((this as Error<Exception>).exception);
    }
  }

  R? successOrNull<R>({
    required R Function(T) success,
  }) {
    if (this is Success) {
      return success((this as Success).data);
    } else {
      return null;
    }
  }

  R? errorOrNull<R>({
    required R Function(Exception?) error,
  }) {
    if (this is Error) {
      return error((this as Error<Exception>).exception);
    } else {
      return null;
    }
  }
}

class Success<T> extends Result<T> {
  final T data;

  const Success({required this.data}) : super();

  @override
  List<Object?> get props => [data];
}

class Error<E extends Exception> extends Result<E> {
  final Exception? exception;

  const Error({required this.exception}) : super();

  @override
  List<Object?> get props => [exception];
}
