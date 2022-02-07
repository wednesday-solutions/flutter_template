import 'package:logger/logger.dart';
import 'package:easy_logger/easy_logger.dart';

class LogHelper {
  static late Logger _instance;
  static bool _initialised = false;

  static void _initialiseLogger() {
    if (!_initialised) {
      final logger = Logger(
        printer: PrettyPrinter(printEmojis: false),
        level: Level.verbose,
      );

      _instance = logger;
      _initialised = true;
    }
  }

  static Logger get logger {
    _initialiseLogger();
    return _instance;
  }
}

customEasyLogger(Object object,
    {String? name, LevelMessages? level, StackTrace? stackTrace}) {
  if (level == LevelMessages.error) {
    log.e(object.toString());
  } else {
    log.d(object.toString());
  }
}

Logger get log => LogHelper.logger;
