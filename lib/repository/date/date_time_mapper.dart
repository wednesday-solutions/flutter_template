import 'package:flutter_template/domain/entity/base/datetime/date_time.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';
import 'package:flutter_template/foundation/global_type_alias.dart';
import 'package:flutter_template/foundation/mapper/mapper.dart';

abstract class DateTimeMapper extends Mapper<DartDateTime, DateTime> {}

class DateTimeMapperImpl extends DateTimeMapper {
  @override
  DateTime map(DartDateTime from) {
    logD("map: from = $from");
    return DateTime(
      year: from.year,
      month: from.month,
      day: from.day,
      hour: from.hour,
      minute: from.minute,
      second: from.second,
      millisecond: from.millisecond,
    );
  }
}
