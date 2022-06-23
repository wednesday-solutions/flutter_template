import 'package:presentation/navigation/base/base_navigator.dart';
import 'package:presentation/navigation/weather/search/search_navigator.dart';

class SearchNavigatorImpl implements SearchNavigator {
  final BaseNavigator baseNavigator;

  SearchNavigatorImpl({required this.baseNavigator});

  @override
  void back() {
    baseNavigator.back();
  }
}
