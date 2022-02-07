import 'package:auto_route/annotations.dart';
import 'package:flutter_template/presentation/entity/routes/routes.dart';
import 'package:flutter_template/presentation/weather/home/home_page.dart';
import 'package:flutter_template/presentation/weather/search/search_page.dart';

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
