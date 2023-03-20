import 'package:flutter_dotenv/flutter_dotenv.dart';

class FlavorValues {
  final String apiBaseUrl;
  final bool useFakeData;
  final bool showLogs;
  final String openWeatherApiKey;

  final bool _logSqlStatements;

  const FlavorValues({
    required this.apiBaseUrl,
    required this.openWeatherApiKey,
    logSqlStatements = false,
    this.showLogs = false,
    this.useFakeData = false,
  }) : _logSqlStatements = showLogs && logSqlStatements;

  bool get logSqlStatements => _logSqlStatements;

  static FlavorValues fromEnvironment() {
    return FlavorValues(
      apiBaseUrl: dotenv.get("OPEN_WEATHER_BASE_URL"),
      openWeatherApiKey: dotenv.get("OPEN_WEATHER_API_KEY"),
    );
  }
}
