import 'package:flutter_template/navigation/base/app_router.dart';
import 'package:flutter_template/navigation/base/base_navigator.dart';
import 'package:flutter_template/navigation/weather/home/home_navigator.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen.dart';

class HomeNavigatorImpl implements HomeNavigator {
  final BaseNavigator navigator;

  HomeNavigatorImpl({required this.navigator});

  @override
  void toSearchScreen() {
    navigator.to(SearchRoute(
      searchScreen: const SearchScreen(),
    ));
  }
}
