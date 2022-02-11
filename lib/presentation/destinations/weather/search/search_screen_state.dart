import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/entity/screen/screen_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_screen_state.freezed.dart';

@freezed
class SearchScreenState with _$SearchScreenState implements ScreenState {
  factory SearchScreenState({
    required UIToolbar toolbar,
    required bool showLoading,
    required List<UIListItem> searchList,
  }) = _SearchScreenState;
}
