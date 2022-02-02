import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/navigation/base/app_router.dart';
import 'package:flutter_template/navigation/base/base_navigator.dart';

class BaseNavigatorImpl implements BaseNavigator {
  final AppRouter appRouter;

  BaseNavigatorImpl({required this.appRouter});

  @override
  void back() {
    appRouter.navigateBack();
  }

  @override
  void to(PageRouteInfo route) {
    appRouter.push(route);
  }
}
