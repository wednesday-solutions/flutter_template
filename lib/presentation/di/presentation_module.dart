import 'package:flutter_template/presentation/weather/home/home_view_model.dart';
import 'package:flutter_template/presentation/weather/search/search_view_model.dart';
import 'package:get_it/get_it.dart';

extension PresentationModule on GetIt {
  void presentationModule() {
    // home
    registerFactory(
      () => HomeViewModel(
        favoriteWeatherInteractor: get(),
        homeNavigator: get(),
      ),
    );

    // search
    registerFactory(
      () => SearchViewModel(
        searchCityInteractor: get(),
        searchNavigator: get(),
        favoriteWeatherInteractor: get(),
      ),
    );
  }
}
