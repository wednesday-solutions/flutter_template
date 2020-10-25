import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'di/service_locator.dart';
import 'presentation/routes/route_generator.dart';
import 'presentation/routes/routes.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.dev);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: Routes.weather,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
