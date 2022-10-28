import 'package:freezed_annotation/freezed_annotation.dart';

part 'date.freezed.dart';

/// Represents a date value.
///
/// Year => Year value
///
/// Month => 1 to 12
///
/// Day => 1 to 31
@freezed
class Date with _$Date {
  const factory Date({
    required int year,
    required int month, // 1 to 12
    required int day, // 1 to 31
  }) = _Date;
}
