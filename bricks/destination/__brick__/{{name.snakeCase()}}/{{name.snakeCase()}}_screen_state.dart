import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/entity/screen/screen_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.snakeCase()}}_screen_state.freezed.dart';

@freezed
class {{name.pascalCase()}}ScreenState with _${{name.pascalCase()}}ScreenState implements ScreenState {
  const factory {{name.pascalCase()}}ScreenState({
    required UIToolbar toolbar,
    required bool showLoading,
  }) = _{{name.pascalCase()}}ScreenState;
}
