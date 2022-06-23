import 'package:presentation/navigation/base/app_router.dart';
import 'package:presentation/navigation/base/base_navigator.dart';
import 'package:presentation/navigation/weather/home/home_navigator.dart';
import 'package:presentation_entity/presentation_entity.dart';

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
