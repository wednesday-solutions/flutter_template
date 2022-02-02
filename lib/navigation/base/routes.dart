import 'package:auto_route/annotations.dart';
import 'package:flutter_template/presentation/entity/routes/routes.dart';
import 'package:flutter_template/presentation/weather/home/home_page.dart';
import 'package:flutter_template/presentation/weather/search/search_page.dart';
import 'package:get/route_manager.dart';

const autoRoutes = [
  AutoRoute(
    path: Routes.HOME,
    page: HomePage,
    initial: true,
  ),
  AutoRoute(
    path: Routes.SEARCH,
    page: SearchPage,
  ),
];

// final unknownRoute = GetPage(name: Routes.UNKNOWN, page: () => ,)) // todo
