class FlavorValues {
  final String apiBaseUrl;
  final bool showLogs;

  final bool _logSqlStatements;

  const FlavorValues({
    required this.apiBaseUrl,
    logSqlStatements = false,
    this.showLogs = false,
  }) : _logSqlStatements = showLogs && logSqlStatements;

  bool get logSqlStatements => _logSqlStatements;
}
