import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/flavors/flavor.dart';
import 'package:flutter_template/flavors/flavor_config.dart';
import 'package:flutter_template/flavors/flavor_values.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExt on WidgetTester {
  Future loadPage({
    required Widget widget,
    required AutoDisposeStateNotifierProvider viewModelProvider,
    required AutoDisposeStateNotifierProvider fakeViewModelProvider,
    MediaQueryData mediaQueryData = const MediaQueryData(
      size: Size(320, 640),
      devicePixelRatio: 3,
    ),
  }) async {
    await pumpWidget(MediaQuery(
      data: mediaQueryData,
      child: MaterialApp(
          useInheritedMediaQuery: true,
          home: ProviderScope(
            overrides: [
              viewModelProvider.overrideWithProvider(fakeViewModelProvider),
            ],
            child: widget,
          )),
    ));
  }
}

void baseSetupAll() {
  FlavorConfig.initialize(
    flavor: Flavor.dev,
    values: const FlavorValues(apiBaseUrl: ""),
  );
}
