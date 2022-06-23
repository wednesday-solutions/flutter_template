import 'package:get_it/get_it.dart';
import 'package:presentation/navigation/base/app_router.dart';
import 'package:presentation/navigation/base/base_navigator.dart';
import 'package:presentation/navigation/base/base_navigator_impl.dart';
import 'package:presentation/navigation/weather/home/home_navigator.dart';
import 'package:presentation/navigation/weather/home/home_navigator_impl.dart';
import 'package:presentation/navigation/weather/search/search_navigator.dart';
import 'package:presentation/navigation/weather/search/search_navigator_impl.dart';

extension NavigationModule on GetIt {
  void navigationModule() {
    // router
    registerLazySingleton(() => AppRouter());

    // base
    registerFactory<BaseNavigator>(() => BaseNavigatorImpl(appRouter: get()));

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
