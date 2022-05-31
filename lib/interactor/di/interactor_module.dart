import 'package:flutter_template/interactor/theme/theme_interactor.dart';
import 'package:flutter_template/interactor/theme/theme_interactor_impl.dart';
import 'package:flutter_template/interactor/theme/theme_mode_mapper.dart';
import 'package:flutter_template/interactor/weather/favorite/favorite_weather_interactor.dart';
import 'package:flutter_template/interactor/weather/favorite/favorite_weather_interactor_impl.dart';
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

    registerFactory<UIWeatherListMapper>(() => UIWeatherListMapperImpl());

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

    // theme
    registerFactory<ThemeModeMapper>(() => ThemeModeMapperImpl());

    registerFactory<ThemeInteractor>(() => ThemeInteractorImpl(
          setThemeModeUseCase: get(),
          getThemeModeUseCase: get(),
          setIsDynamicThemeEnabled: get(),
          getIsDynamicThemeEnabled: get(),
          themeModeMapper: get(),
        ));
  }
}
