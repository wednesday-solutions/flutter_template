import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest(
    'counter state is the same after going to home and switching apps',
        nativeAutomation: true,
        (patrol) async {
      // Replace later with your app's main widget
      await patrol.pumpWidgetAndSettle(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text('app')),
            backgroundColor: Colors.blue,
          ),
        ),
      );

      expect(patrol('app'), findsOneWidget);
      await patrol.native.openQuickSettings();
      await patrol.native.pressHome();
    },
  );
}
