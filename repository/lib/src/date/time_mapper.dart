import 'package:domain_entity/domain_entity.dart';
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
