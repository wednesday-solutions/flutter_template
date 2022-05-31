import 'package:flutter_template/domain/entity/base/datetime/date.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';
import 'package:flutter_template/foundation/global_type_alias.dart';
import 'package:flutter_template/foundation/mapper/mapper.dart';

abstract class DateMapper extends Mapper<DartDateTime, Date> {}

class DateMapperImpl extends DateMapper {
  @override
  Date map(DartDateTime from) {
    logD("map: from = $from");
    return Date(
      year: from.year,
      month: from.month,
      day: from.day,
    );
  }
}
