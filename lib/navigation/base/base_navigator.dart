import 'package:auto_route/auto_route.dart';

abstract interface class BaseNavigator {
  void to(PageRouteInfo route);

  void back();
}
