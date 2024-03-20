import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_template/foundation/extensions/dotenv_ext.dart';

class FlavorValues {
  final String apiBaseUrl;
  final bool useFakeData;
  final bool showLogs;
  final String openWeatherApiKey;
  final bool useGoogleFonts;
  final bool renderFontsInTest;

  final bool _logSqlStatements;

  const FlavorValues({
    required this.apiBaseUrl,
    required this.openWeatherApiKey,
    logSqlStatements = false,
    this.showLogs = false,
    this.useFakeData = false,
    required this.useGoogleFonts,
    required this.renderFontsInTest,
  }) : _logSqlStatements = showLogs && logSqlStatements;

  bool get logSqlStatements => _logSqlStatements;

  static FlavorValues fromEnvironment() {
    return FlavorValues(
        apiBaseUrl: dotenv.get("OPEN_WEATHER_BASE_URL"),
        openWeatherApiKey: dotenv.get("OPEN_WEATHER_API_KEY"),
        showLogs: dotenv.getBoolOrDefault("SHOW_LOGS", fallback: false),
        logSqlStatements: dotenv.getBoolOrDefault("LOG_SQL", fallback: false),
        useGoogleFonts:
            dotenv.getBoolOrDefault("USE_GOOGLE_FONTS", fallback: true),
        renderFontsInTest:
            dotenv.getBoolOrDefault("RENDER_FONTS_IN_TEST", fallback: false));
  }
}
