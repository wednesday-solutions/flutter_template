import 'package:flutter/material.dart';
import 'package:flutter_template/di/service_locator.dart';
import 'package:flutter_template/routes/weather_route.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherRoute(),
    );
  }
}
