import 'package:flutter_template/domain/entity/base/datetime/time.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';
import 'package:flutter_template/foundation/global_type_alias.dart';
import 'package:flutter_template/foundation/mapper/mapper.dart';

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
