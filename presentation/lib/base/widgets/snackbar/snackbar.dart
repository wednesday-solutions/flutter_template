import 'package:flutter/material.dart';
import 'package:presentation_entity/presentation_entity.dart';

GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void showSnackbar(SnackBarEffect effect) async {
  if (effect.closeCurrentSnackbar) {
    scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
  }

  final snackBar = SnackBar(
    content: Text(effect.text),
    duration: effect.duration,
    behavior: effect.behavior,
  );

  scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
}
