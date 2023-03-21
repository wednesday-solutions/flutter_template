import 'package:flutter_template/presentation/entity/intent/intent.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.snakeCase()}}_screen_intent.freezed.dart';

@freezed
class {{name.pascalCase()}}ScreenIntent with _${{name.pascalCase()}}ScreenIntent implements BaseIntent {
  factory {{name.pascalCase()}}ScreenIntent.newIntent() = _HomeScreenIntent_NewIntent;
}
