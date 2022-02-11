import 'package:auto_route/annotations.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_page.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_page.dart';
import 'package:flutter_template/presentation/entity/routes/routes.dart';

const autoRoutes = [
  AutoRoute(
    path: Routes.home,
    page: HomePage,
    initial: true,
  ),
  AutoRoute(
    path: Routes.search,
    page: SearchPage,
  ),
];
