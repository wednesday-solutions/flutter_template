import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import 'app_setup.dart';
import 'test_actions.dart';

void main() {
  patrolTest(
    'user can search cities and add or remove them from favorites',
    (patrol) async {
      await setupApp(patrol);

      await _navigateSearchForBengaluruAndMarkFavorite(patrol);
      await patrol.tap(find.byIcon(Icons.arrow_back));
      await Future.delayed(const Duration(seconds: 1));
      expect(find.text("Bengaluru, IN"), findsOneWidget);
      await _navigateSearchForBengaluruAndMarkFavorite(
        patrol,
        alreadySelected: true,
      );
      await patrol.tap(find.byIcon(Icons.arrow_back));
      expect(find.text("Bengaluru, IN"), findsNothing);
    },
  );
}

Future _navigateSearchForBengaluruAndMarkFavorite(
  PatrolIntegrationTester patrol, {
  bool alreadySelected = false,
}) async {
  await navigateToSearch(patrol);
  await patrol.enterText(find.byType(TextField), "Bengaluru",
      settlePolicy: SettlePolicy.settle);
  if (alreadySelected) {
    await patrol.tap(
      find.byIcon(Icons.favorite),
      settlePolicy: SettlePolicy.settle,
    );
  } else {
    await patrol.tap(
      find.byIcon(Icons.favorite_outline),
      settlePolicy: SettlePolicy.settle,
    );
  }
}
