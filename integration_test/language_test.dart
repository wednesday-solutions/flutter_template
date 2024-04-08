import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/intl/translations/translation_keys.dart';
import 'package:flutter_template/presentation/intl/translations/translation_loader.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import 'app_setup.dart';
import 'test_actions.dart';

void main() {
  patrolTest(
    "users are able to change the language of the app",
    (patrol) async {
      await setupApp(patrol);

      expect(find.text(CodegenLoader.en_US[LocaleKeys.homePageTitle]),
          findsOneWidget);

      await navigateToSearch(patrol);
      expect(find.text(CodegenLoader.en_US[LocaleKeys.searchPageTitle]),
          findsOneWidget);
      expect(find.text(CodegenLoader.en_US[LocaleKeys.searchResultsAppearHere]),
          findsOneWidget);

      await patrol.tap(find.byIcon(Icons.arrow_back));

      await patrol.tap(find.byIcon(Icons.language));

      expect(find.text(CodegenLoader.hi_IN[LocaleKeys.homePageTitle]),
          findsOneWidget);

      await navigateToSearch(patrol);
      expect(find.text(CodegenLoader.hi_IN[LocaleKeys.searchPageTitle]),
          findsOneWidget);
      expect(find.text(CodegenLoader.hi_IN[LocaleKeys.searchResultsAppearHere]),
          findsOneWidget);
    },
  );
}
