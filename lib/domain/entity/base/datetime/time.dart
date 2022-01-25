import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'time.freezed.dart';

///
/// Represents a time value.
///
/// Hour => 0 to 23
///
/// Minute => 0 to 59
///
/// Second => 0 to 59
///
/// Millisecond => 0 to 999
@freezed
class Time with _$Time {
  const factory Time({
    required int hour, // 0 to 23
    required int minute, // 0 to 59
    required int second, // 0 to 59
    required int millisecond, // 0 to 999
  }) = _Time;
}
