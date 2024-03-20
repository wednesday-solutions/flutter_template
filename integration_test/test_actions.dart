import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

Future navigateToSearch(PatrolIntegrationTester patrol) async {
  await patrol.tap(find.byIcon(Icons.search));
}
