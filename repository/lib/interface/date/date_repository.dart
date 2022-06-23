import 'package:domain_entity/domain_entity.dart';
import 'package:foundation/foundation.dart';

abstract class DateRepository {
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
