import 'package:flutter_template/domain/model/base/datetime/date.dart';
import 'package:flutter_template/domain/model/base/datetime/date_time.dart';
import 'package:flutter_template/domain/model/base/datetime/time.dart';
import 'package:flutter_template/foundation/global_type_alias.dart';

abstract class DateRepository {
  DartDateTime nowDartDateTime();
  Date todayDate();
  Time nowTime();
  DateTime nowDateTime();
  Date mapDartDateTimeToDate(DartDateTime dateTime);
}