import 'package:flutter/material.dart';

import '../pages/cities/page.dart';
import '../pages/weather/page.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.weather:
        return _route(WeatherPage());
      case Routes.cities:
        return _route(CitiesPage());
      default:
        return _route(WeatherPage());
    }
  }

  static Route<dynamic> _route(Widget page) {
    return MaterialPageRoute(builder: (context) {
      return page;
    },);
  }
}
