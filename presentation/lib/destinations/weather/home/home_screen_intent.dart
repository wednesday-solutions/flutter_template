import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation_entity/presentation_entity.dart';

part 'home_screen_intent.freezed.dart';

@freezed
class HomeScreenIntent with _$HomeScreenIntent implements BaseIntent {
  factory HomeScreenIntent.search() = _HomeScreenIntent_Search;
}
