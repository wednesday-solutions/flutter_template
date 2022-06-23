import 'package:foundation/foundation.dart';

class JsonDateTimeConverter {
  static DartDateTime fromJson(String date) {
    return DartDateTime.parse(date);
  }

  static String toJson(DartDateTime dateTime) {
    return dateTime.toIso8601String();
  }
}
