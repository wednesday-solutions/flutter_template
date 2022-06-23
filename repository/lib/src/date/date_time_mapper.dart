import 'package:domain_entity/domain_entity.dart';
import 'package:foundation/foundation.dart';

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
