class JsonDateTimeConverter {
  static DateTime fromJson(String date) {
    return DateTime.parse(date);
  }

  static String toJson(DateTime dateTime) {
    return dateTime.toIso8601String();
  }
}
