import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_result.freezed.dart';

@freezed
class UIResult<T> with _$UIResult {
  factory UIResult.success(T data) = _Success<T>;

  factory UIResult.error(Exception? exception) = _Error;
}
