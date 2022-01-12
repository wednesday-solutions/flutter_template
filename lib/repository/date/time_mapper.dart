import 'package:flutter_template/domain/model/base/datetime/time.dart';
import 'package:flutter_template/foundation/global_type_alias.dart';
import 'package:flutter_template/foundation/mapper/mapper.dart';

abstract class TimeMapper extends Mapper<DartDateTime, Time> {}

class TimeMapperImpl extends TimeMapper {
  @override
  Time map(DartDateTime from) => Time(
    hour: from.hour,
    minute: from.minute,
    second: from.second,
    millisecond: from.millisecond,
  );
}