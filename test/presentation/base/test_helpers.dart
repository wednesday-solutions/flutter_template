import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExt on WidgetTester {
  Future loadPage({
    required Widget widget,
    required AutoDisposeStateNotifierProvider viewModelProvider,
    required AutoDisposeStateNotifierProvider fakeViewModelProvider,
  }) async {
    await pumpWidget(MaterialApp(
        home: ProviderScope(
      overrides: [
        viewModelProvider.overrideWithProvider(fakeViewModelProvider),
      ],
      child: widget,
    )));
  }
}
