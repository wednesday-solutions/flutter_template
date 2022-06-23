import 'package:get_it/get_it.dart';
import 'package:presentation/base/theme/theme_view_model.dart';
import 'package:presentation/base/theme/theme_view_model_impl.dart';
import 'package:presentation/destinations/weather/home/home_view_model.dart';
import 'package:presentation/destinations/weather/home/home_view_model_impl.dart';
import 'package:presentation/destinations/weather/search/search_view_model.dart';
import 'package:presentation/destinations/weather/search/search_view_model_impl.dart';

extension PresentationModule on GetIt {
  void presentationModule() {
    // home
    registerFactory<HomeViewModel>(
      () => HomeViewModelImpl(
        favoriteWeatherInteractor: get(),
        homeNavigator: get(),
      ),
    );

    // search
    registerFactory<SearchViewModel>(
      () => SearchViewModelImpl(
        searchCityInteractor: get(),
        searchNavigator: get(),
        favoriteWeatherInteractor: get(),
      ),
    );

    // theme
    registerFactory<ThemeViewModel>(() => ThemeViewModelImpl(
          themeInteractor: get(),
        ));
  }
}
