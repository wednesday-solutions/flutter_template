import 'package:flutter_template/domain/entity/base/datetime/time.dart';
import 'package:foundation/foundation.dart';

abstract class TimeMapper extends Mapper<DartDateTime, Time> {}

class TimeMapperImpl extends TimeMapper {
  @override
  Time map(DartDateTime from) {
    logD("map: from = $from");
    return Time(
      hour: from.hour,
      minute: from.minute,
      second: from.second,
      millisecond: from.millisecond,
    );
  }
}
