import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar(
    {required String text,
    Duration? duration,
    bool closeCurrentSnackbar = true}) async {
  if (closeCurrentSnackbar) {
    await Get.closeCurrentSnackbar();
  }

  Get.rawSnackbar(
    margin: const EdgeInsets.all(8.0),
    padding: const EdgeInsets.all(16.0),
    messageText: Text(text),
    borderRadius: 5,
    duration: duration ?? const Duration(seconds: 3),
    animationDuration: const Duration(milliseconds: 300),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Get.theme.snackBarTheme.backgroundColor ?? Colors.black45,
  );
}
