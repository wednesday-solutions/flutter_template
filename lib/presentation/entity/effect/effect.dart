import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'effect.freezed.dart';

@freezed
class Effect with _$Effect {
  factory Effect.snackBar({
    required String text,
    @Default(Duration(seconds: 4)) Duration duration,
    @Default(true) bool closeCurrentSnackbar,
    @Default(SnackBarBehavior.floating) SnackBarBehavior behavior,
  }) = SnackBarEffect;

  factory Effect.hideKeyboard() = HideKeyboardEffect;
}
