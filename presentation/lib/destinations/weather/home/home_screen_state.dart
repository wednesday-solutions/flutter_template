import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation_entity/presentation_entity.dart';

part 'home_screen_state.freezed.dart';

@freezed
class HomeScreenState with _$HomeScreenState implements ScreenState {
  const factory HomeScreenState({
    required UIToolbar toolbar,
    required bool showLoading,
    required List<UIListItem> weatherList,
  }) = _HomeScreenState;
}
