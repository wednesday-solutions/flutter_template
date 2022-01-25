import 'package:flutter_template/domain/entity/base/datetime/date.dart';
import 'package:flutter_template/domain/entity/base/datetime/date_time.dart';
import 'package:flutter_template/domain/entity/base/datetime/time.dart';
import 'package:flutter_template/foundation/global_type_alias.dart';
import 'package:flutter_template/repository/date/date_mapper.dart';
import 'package:flutter_template/repository/date/date_repository.dart';
import 'package:flutter_template/repository/date/date_time_mapper.dart';
import 'package:flutter_template/repository/date/time_mapper.dart';
import 'package:intl/intl.dart';

class DateRepositoryImpl implements DateRepository {
  final DateMapper dateMapper;
  final TimeMapper timeMapper;
  final DateTimeMapper dateTimeMapper;

  DateRepositoryImpl({
    required this.dateMapper,
    required this.timeMapper,
    required this.dateTimeMapper,
  });

  @override
  DartDateTime nowDartDateTime() {
    return DartDateTime.now();
  }

  @override
  DateTime nowDateTime() {
    return dateTimeMapper.map(nowDartDateTime());
  }

  @override
  Time nowTime() {
    return timeMapper.map(nowDartDateTime());
  }

  @override
  Date todayDate() {
    return dateMapper.map(nowDartDateTime());
  }

  @override
  Date mapDartDateTimeToDate(DartDateTime dateTime) {
    return dateMapper.map(dateTime);
  }

  @override
  DartDateTime mapDartDateTimeFromDate(Date date) {
    return DartDateTime(
      date.year,
      date.month,
      date.day,
    );
  }

  @override
  String formatDate(Date date, String format) {
    final dartDateTime = mapDartDateTimeFromDate(date);
    return DateFormat(format).format(dartDateTime);
  }

  @override
  int convertDateToMillis(Date date) {
    final dartDate = mapDartDateTimeFromDate(date);
    return dartDate.millisecondsSinceEpoch;
  }
}
