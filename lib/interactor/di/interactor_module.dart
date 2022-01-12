import 'package:flutter_template/interactor/weather/search/city_search_result_mapper.dart';
import 'package:flutter_template/interactor/weather/search/search_city_interactor.dart';
import 'package:flutter_template/interactor/weather/search/search_city_interactor_impl.dart';
import 'package:flutter_template/interactor/weather/search/ui_city_mapper.dart';
import 'package:get_it/get_it.dart';

extension InteractorModule on GetIt {
  void interactorModule() {
    // weather
    registerFactory<UICityMapper>(() => UICityMapperImpl());

    registerFactory<CitySearchResultMapper>(() => CitySearchResultMapperImpl(
          uiCityMapper: get(),
        ));

    registerFactory<SearchCityInteractor>(() => SearchCityInteractorImpl(
          searchCitiesUseCase: get(),
          favoriteCitiesStreamUseCase: get(),
          citySearchResultMapper: get(),
        ));
  }
}
