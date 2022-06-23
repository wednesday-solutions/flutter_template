import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation_entity/presentation_entity.dart';

part 'search_screen_state.freezed.dart';

@freezed
class SearchScreenState with _$SearchScreenState implements ScreenState {
  factory SearchScreenState({
    required UIToolbar toolbar,
    required bool showLoading,
    required List<UIListItem> searchList,
  }) = _SearchScreenState;
}
