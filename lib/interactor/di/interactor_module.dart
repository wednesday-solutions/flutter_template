import 'package:flutter_template/interactor/weather/favorite/favorite_weather_interactor.dart';
import 'package:flutter_template/interactor/weather/favorite/favorite_weather_interactor_impl.dart';
import 'package:flutter_template/interactor/weather/favorite/ui_day_weather_mapper.dart';
import 'package:flutter_template/interactor/weather/favorite/ui_weather_list_mapper.dart';
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

    registerFactory<UIDayWeatherMapper>(() => UIDayWeatherMapperImpl(
          formatDateUseCase: get(),
        ));

    registerFactory<UIWeatherListMapper>(() => UIWeatherListMapperImpl(
          dayWeatherMapper: get(),
          dateInMillisUseCase: get(),
        ));

    registerFactory<SearchCityInteractor>(() => SearchCityInteractorImpl(
          searchCitiesUseCase: get(),
          favoriteCitiesStreamUseCase: get(),
          citySearchResultMapper: get(),
        ));

    registerFactory<FavoriteWeatherInteractor>(
        () => FavoriteWeatherInteractorImpl(
              fetchFavoriteCitiesWeatherUseCase: get(),
              getFavoriteCitiesStreamUseCase: get(),
              setCityFavoriteUseCase: get(),
              removeFavoriteCityUseCase: get(),
              getFavoriteCitiesWeatherStreamUseCase: get(),
              uiCityMapper: get(),
              weatherListMapper: get(),
            ));
  }
}
