import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/navigation/base/app_router.dart';
import 'package:flutter_template/presentation/entity/routes/routes.dart';

final autoRoutes = [
  AutoRoute(
    path: Routes.home,
    page: HomeRoute.page,
  ),
  AutoRoute(
    path: Routes.search,
    page: SearchRoute.page,
  ),
];
