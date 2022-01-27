import 'package:flutter_template/navigation/base/base_navigator.dart';
import 'package:flutter_template/navigation/weather/home/home_navigator.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';

class HomeNavigatorImpl implements HomeNavigator {
  final BaseNavigator navigator;

  HomeNavigatorImpl({required this.navigator});

  @override
  void toSearchScreen() {
    navigator.to(const SearchScreen());
  }
}
