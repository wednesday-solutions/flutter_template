import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_time.freezed.dart';

///
/// Represents a date time value.
///
/// Year => Year value
///
/// Month => 1 to 12
///
/// Day => 1 to 31
///
/// Hour => 0 to 23
///
/// Minute => 0 to 59
///
/// Second => 0 to 59
///
/// Millisecond => 0 to 999
@freezed
class DateTime with _$DateTime {
  const factory DateTime({
    required int year,
    required int month, // 1 to 12
    required int day, // 1 to 31
    required int hour, // 0 to 23
    required int minute, // 0 to 59
    required int second, // 0 to 59
    required int millisecond, // 0 to 999
  }) = _DateTime;
}
