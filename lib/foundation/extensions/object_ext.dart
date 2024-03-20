import 'package:flutter_template/foundation/logger/logger.dart';

extension ObjectExt on Object {
  void logD(String message) {
    log.d("$runtimeType: $message");
  }

  void logE(Object? error, {StackTrace? stacktrace}) {
    log.e(error, stackTrace: stacktrace);
  }
}
