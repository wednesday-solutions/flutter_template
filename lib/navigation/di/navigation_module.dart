import 'package:flutter_template/navigation/base/base_navigator.dart';
import 'package:flutter_template/navigation/base/base_navigator_impl.dart';
import 'package:flutter_template/navigation/weather/home/home_navigator.dart';
import 'package:flutter_template/navigation/weather/home/home_navigator_impl.dart';
import 'package:flutter_template/navigation/weather/search/search_navigator.dart';
import 'package:flutter_template/navigation/weather/search/search_navigator_impl.dart';
import 'package:get_it/get_it.dart';

extension NavigationModule on GetIt {
  void navigationModule() {
    // base
    registerFactory<BaseNavigator>(() => BaseNavigatorImpl());

    // home
    registerFactory<HomeNavigator>(
      () => HomeNavigatorImpl(navigator: get()),
    );

    // search
    registerFactory<SearchNavigator>(
      () => SearchNavigatorImpl(baseNavigator: get()),
    );
  }
}
