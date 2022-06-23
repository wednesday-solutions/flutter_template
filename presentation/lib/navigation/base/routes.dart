import 'package:auto_route/annotations.dart';
import 'package:presentation/destinations/weather/home/home_page.dart';
import 'package:presentation/destinations/weather/search/search_page.dart';
import 'package:presentation_entity/presentation_entity.dart';

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
