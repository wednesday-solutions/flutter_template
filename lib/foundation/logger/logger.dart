import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/flavors/flavor_config.dart';
import 'package:logger/logger.dart';

class LogHelper {
  static late Logger _instance;
  static bool _initialised = false;

  static void _initialiseLogger() {
    if (!_initialised) {
      final logger = Logger(
        filter: _FlutterTemplateLogFilter(),
        printer: PrettyPrinter(printEmojis: false),
        level: Level.trace,
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

class _FlutterTemplateLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    try {
      return kDebugMode && FlavorConfig.values.showLogs;
    } catch (_) {
      return true;
    }
  }
}
