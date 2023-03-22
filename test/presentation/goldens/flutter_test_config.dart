import 'dart:async';

import 'package:flutter_template/flavors/flavor_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../base/test_helpers.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await baseSetupAll();
  if (FlavorConfig.values.renderFontsInTest) {
    await loadAppFonts();
  }
  return testMain();
}
