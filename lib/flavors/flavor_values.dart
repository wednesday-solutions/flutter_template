import 'package:flutter_template/secrets/app_secrets.dart';

class FlavorValues {
  final String apiBaseUrl;
  final bool showLogs;
  final AppSecrets secrets;

  final bool _logSqlStatements;

  const FlavorValues({
    required this.apiBaseUrl,
    required this.secrets,
    logSqlStatements = false,
    this.showLogs = false,
  }) : _logSqlStatements = showLogs && logSqlStatements;

  bool get logSqlStatements => _logSqlStatements;
}
