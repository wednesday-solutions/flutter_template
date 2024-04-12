import 'package:flutter_template/domain/entity/base/datetime/date.dart';
import 'package:flutter_template/domain/entity/base/datetime/date_time.dart';
import 'package:flutter_template/domain/entity/base/datetime/time.dart';
import 'package:flutter_template/foundation/global_type_alias.dart';

abstract interface class DateRepository {
  DartDateTime nowDartDateTime();

  Date todayDate();

  Time nowTime();

  DateTime nowDateTime();

  Date mapDartDateTimeToDate(DartDateTime dateTime);

  DartDateTime mapDartDateTimeFromDate(Date date);

  DartDateTime mapDartDateTimeFromDateTime(DateTime date);

  String formatDate(Date date, String format);

  int convertDateToMillis(Date date);

  int convertDateTimeToMillis(DateTime date);
}
