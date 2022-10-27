import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/entity/screen/screen_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_state.freezed.dart';

@freezed
class HomeScreenState with _$HomeScreenState implements ScreenState {
  const factory HomeScreenState({
    required UIToolbar toolbar,
    required bool showLoading,
    required List<UIListItem> weatherList,
  }) = _HomeScreenState;
}
