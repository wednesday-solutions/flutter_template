// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_template/routes/weather_route.dart';

import 'package:flutter_template/model/weather.dart';
import 'package:flutter_template/model/consolidated_weather.dart';

void main() {
 /*  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  }); */
  testWidgets('WeatherList should display city name & weather details ', (WidgetTester tester) async {
    var weatherData = [
      ConsolidatedWeather( 1, 'test', 'tst', 'NE', 20, 30, 27, 60, 1.008, 99, 1, 60 )];
    var input = [Weather('Pune', weatherData)];
    await tester.pumpWidget(MaterialApp(
      title: 'Flutter Test',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Center(
          child: WeatherList(input),
        ),
      ),
    ));

    // the List should display the City name provided
    expect(find.text('Pune'), findsOneWidget);
    // the List item should display the minimum and maximum temperatures.
    expect(find.text('Min Temp: 20° Max Temp: 30°'), findsOneWidget);
  });
}
