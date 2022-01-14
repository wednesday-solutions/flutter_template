import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_toolbar.freezed.dart';

@freezed
class UIToolbar with _$UIToolbar {
  factory UIToolbar({
    required String title,
    required bool hasBackButton,
  }) = _UIToolbar;
}
