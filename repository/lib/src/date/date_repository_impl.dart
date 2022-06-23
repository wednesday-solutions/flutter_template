import 'package:domain_entity/domain_entity.dart';
import 'package:foundation/foundation.dart';
import 'package:intl/intl.dart';
import 'package:repository/interface/date/date_repository.dart';
import 'package:repository/src/date/date_mapper.dart';
import 'package:repository/src/date/date_time_mapper.dart';
import 'package:repository/src/date/time_mapper.dart';

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
    logD("nowDartDateTime");
    return DartDateTime.now();
  }

  @override
  DateTime nowDateTime() {
    logD("nowDateTime");
    return dateTimeMapper.map(nowDartDateTime());
  }

  @override
  Time nowTime() {
    logD("nowTime");
    return timeMapper.map(nowDartDateTime());
  }

  @override
  Date todayDate() {
    logD("todayDate");
    return dateMapper.map(nowDartDateTime());
  }

  @override
  Date mapDartDateTimeToDate(DartDateTime dateTime) {
    logD("mapDartDateTimeToDate: dateTime = $dateTime");
    return dateMapper.map(dateTime);
  }

  @override
  DartDateTime mapDartDateTimeFromDate(Date date) {
    logD("mapDartDateTimeFromDate: date = $date");
    return DartDateTime(
      date.year,
      date.month,
      date.day,
    );
  }

  @override
  DartDateTime mapDartDateTimeFromDateTime(DateTime date) {
    logD("mapDartDateTimeFromDateTime: date = $date");
    return DartDateTime(
      date.year,
      date.month,
      date.day,
      date.hour,
      date.minute,
      date.second,
      date.millisecond,
      0,
    );
  }

  @override
  String formatDate(Date date, String format) {
    logD("formatDate: date = $date, format = $format");
    final dartDateTime = mapDartDateTimeFromDate(date);
    return DateFormat(format).format(dartDateTime);
  }

  @override
  int convertDateToMillis(Date date) {
    logD("convertDateToMillis: date = $date");
    final dartDate = mapDartDateTimeFromDate(date);
    return dartDate.millisecondsSinceEpoch;
  }

  @override
  int convertDateTimeToMillis(DateTime date) {
    logD("convertDateTimeToMillis: date = $date");
    final dartDate = mapDartDateTimeFromDateTime(date);
    return dartDate.millisecondsSinceEpoch;
  }
}
