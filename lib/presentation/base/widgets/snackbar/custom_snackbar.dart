import 'package:flutter/material.dart';

GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void showSnackbar(
    {required String text,
    Duration? duration,
    bool closeCurrentSnackbar = true}) async {
  scaffoldMessengerKey.currentState?.hideCurrentSnackBar();

  final snackBar = SnackBar(content: Text(text));

  scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
}
