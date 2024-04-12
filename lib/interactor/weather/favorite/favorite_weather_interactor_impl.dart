import 'package:flutter_template/core/entity/result.dart';
import 'package:flutter_template/domain/weather/fetch_favorite_cities_weather_use_case.dart';
import 'package:flutter_template/domain/weather/get_favorite_cities_stream_use_case.dart';
import 'package:flutter_template/domain/weather/get_favorite_cities_weather_stream_use_case.dart';
import 'package:flutter_template/domain/weather/remove_favorite_city_use_case.dart';
import 'package:flutter_template/domain/weather/set_city_favorite_use_case.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';
import 'package:flutter_template/foundation/unit.dart';
import 'package:flutter_template/interactor/weather/favorite/favorite_weather_interactor.dart';
import 'package:flutter_template/interactor/weather/favorite/ui_weather_list_mapper.dart';
import 'package:flutter_template/interactor/weather/search/ui_city_mapper.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';

class FavoriteWeatherInteractorImpl implements FavoriteWeatherInteractor {
  final FetchFavoriteCitiesWeatherUseCase fetchFavoriteCitiesWeatherUseCase;
  final GetFavoriteCitiesStreamUseCase getFavoriteCitiesStreamUseCase;
  final SetCityFavoriteUseCase setCityFavoriteUseCase;
  final RemoveFavoriteCityUseCase removeFavoriteCityUseCase;
  final GetFavoriteCitiesWeatherStreamUseCase
      getFavoriteCitiesWeatherStreamUseCase;
  final UICityMapper uiCityMapper;
  final UIWeatherListMapper weatherListMapper;

  FavoriteWeatherInteractorImpl({
    required this.fetchFavoriteCitiesWeatherUseCase,
    required this.getFavoriteCitiesStreamUseCase,
    required this.setCityFavoriteUseCase,
    required this.removeFavoriteCityUseCase,
    required this.getFavoriteCitiesWeatherStreamUseCase,
    required this.uiCityMapper,
    required this.weatherListMapper,
  });

  @override
  Future<Result<void>> fetchFavouriteCitiesWeather() async {
    logD("fetchFavouriteCitiesWeather");
    return await fetchFavoriteCitiesWeatherUseCase(param: unit);
  }

  @override
  Stream<List<UICity>> getFavoriteCitiesStream() {
    logD("getFavoriteCitiesStream");
    return getFavoriteCitiesStreamUseCase(unit)
        .map(uiCityMapper.mapFavouriteCityList);
  }

  @override
  Stream<List<UIListItem>> getFavoriteWeatherUIList() {
    logD("getFavoriteWeatherUIList");
    return getFavoriteCitiesWeatherStreamUseCase(unit)
        .map(weatherListMapper.map);
  }

  @override
  Future<Result<void>> removeCityFavorite(UICity uiCity) async {
    logD("removeCityFavorite: uiCity = $uiCity");
    return await removeFavoriteCityUseCase(
      param: uiCityMapper.mapCity(uiCity),
    );
  }

  @override
  Future<Result<void>> setCityFavorite(UICity uiCity) async {
    logD("setCityFavorite: uiCity = $uiCity");
    return await setCityFavoriteUseCase(
      param: uiCityMapper.mapCity(uiCity),
    );
  }
}
