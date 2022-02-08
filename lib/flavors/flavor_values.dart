class FlavorValues {
  final String apiBaseUrl;
  final bool logSqlStatements;

  const FlavorValues({
    required this.apiBaseUrl,
    this.logSqlStatements = false,
  });
}
