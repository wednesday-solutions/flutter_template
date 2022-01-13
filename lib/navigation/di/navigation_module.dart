import 'package:flutter_template/navigation/base/base_navigator.dart';
import 'package:flutter_template/navigation/base/base_navigator_impl.dart';
import 'package:flutter_template/navigation/search/search_navigator.dart';
import 'package:flutter_template/navigation/search/search_navigator_impl.dart';
import 'package:get_it/get_it.dart';

extension NavigationModule on GetIt {
  void navigationModule() {
    // base
    registerFactory<BaseNavigator>(() => BaseNavigatorImpl());

    // search
    registerFactory<SearchNavigator>(
      () => SearchNavigatorImpl(baseNavigator: get()),
    );
  }
}
