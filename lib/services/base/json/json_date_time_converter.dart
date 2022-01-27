import 'package:flutter_template/foundation/global_type_alias.dart';

class JsonDateTimeConverter {
  static DartDateTime fromJson(String date) {
    return DartDateTime.parse(date);
  }

  static String toJson(DartDateTime dateTime) {
    return dateTime.toIso8601String();
  }
}
