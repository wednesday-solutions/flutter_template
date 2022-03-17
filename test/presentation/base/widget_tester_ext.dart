import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/theme/template_app_theme_data.dart';
import 'package:flutter_template/presentation/intl/translations/translation_loader.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

extension WidgetTesterExt on WidgetTester {
  Future loadPageForGolden({
    required Widget page,
    required AutoDisposeStateNotifierProvider viewModelProvider,
    required AutoDisposeStateNotifierProvider fakeViewModelProvider,
  }) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();

    await pumpWidget(
      EasyLocalization(
        supportedLocales: const [Locale("en", "US")],
        path: "assets/translations",
        fallbackLocale: const Locale("en", "US"),
        assetLoader: const CodegenLoader(),
        child: Builder(builder: (context) {
          return MaterialApp(
            theme: lightTheme,
            debugShowCheckedModeBanner: false,
            darkTheme: darkTheme,
            themeMode: ThemeMode.dark,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            home: ProviderScope(
              overrides: [
                viewModelProvider.overrideWithProvider(fakeViewModelProvider),
              ],
              child: page,
            ),
          );
        }),
      ),
    );
    await pumpAndSettle();
  }

  Future loadPage({
    required Widget widget,
    required AutoDisposeStateNotifierProvider viewModelProvider,
    required AutoDisposeStateNotifierProvider fakeViewModelProvider,
    MediaQueryData mediaQueryData = const MediaQueryData(
      size: Size(320, 640),
      devicePixelRatio: 3,
    ),
  }) async {
    await pumpWidget(
      MediaQuery(
        data: mediaQueryData,
        child: MaterialApp(
          useInheritedMediaQuery: true,
          home: ProviderScope(
            overrides: [
              viewModelProvider.overrideWithProvider(fakeViewModelProvider),
            ],
            child: widget,
          ),
        ),
      ),
    );
  }
}

@isTest
testPageGolden(
  String description, {
  required String goldenName,
  List<Device>? devices,
  CustomPump? customPump,
  required Future Function(WidgetTester tester) test,
}) {
  testGoldens(
    description,
    (tester) async {
      await test(tester);

      await multiScreenGolden(
        tester,
        goldenName,
        devices: devices ??
            [
              Device.iphone11,
              Device.phone.copyWith(name: "smallPhone"),
            ],
        customPump: customPump,
      );
    },
    // Only run golden tests on one platform (macos in this case) to maintain
    // consistency of rendered png images.
    skip: !Platform.isMacOS,
  );
}
