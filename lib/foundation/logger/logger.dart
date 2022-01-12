import 'package:logger/logger.dart';

class LogHelper {
  static late Logger _instance;
  static bool _initailised = false;

  static void initialiseLogger() {
    if (!_initailised) {
      final logger = Logger(
        printer: PrettyPrinter(printEmojis: false),
        level: Level.verbose,
      );

      _instance = logger;
      _initailised = true;
    }
  }

  static Logger get logger => _instance;
}

Logger get log => LogHelper.logger;
