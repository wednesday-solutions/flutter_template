import 'package:flutter_template/presentation/weather/search/search_controller.dart';
import 'package:get_it/get_it.dart';

extension PresentationModule on GetIt {
  void presentationModule() {
    // search
    registerFactory(() => SearchController(
          searchCityInteractor: get(),
          searchNavigator: get(),
          favoriteWeatherInteractor: get(),
        ));
  }
}
