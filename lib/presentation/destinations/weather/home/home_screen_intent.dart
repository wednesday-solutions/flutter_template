import 'package:flutter/foundation.dart';
import 'package:flutter_template/presentation/entity/intent/intent.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_intent.freezed.dart';

@freezed
class HomeScreenIntent with _$HomeScreenIntent implements BaseIntent {
  factory HomeScreenIntent.search() = _HomeScreenIntent_Search;
}
