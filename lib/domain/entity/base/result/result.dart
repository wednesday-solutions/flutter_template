import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  factory Result.success(T data) = Success<T>;

  factory Result.error(Exception? exception) = Error;
}
