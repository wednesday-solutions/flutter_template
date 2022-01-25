import 'package:flutter_template/domain/weather/fetch_favorite_cities_weather_use_case.dart';
import 'package:flutter_template/domain/weather/get_favorite_cities_stream_use_case.dart';
import 'package:flutter_template/domain/weather/get_favorite_cities_weather_stream_use_case.dart';
import 'package:flutter_template/domain/weather/remove_favorite_city_use_case.dart';
import 'package:flutter_template/domain/weather/set_city_favorite_use_case.dart';
import 'package:flutter_template/foundation/unit.dart';
import 'package:flutter_template/interactor/base/base_interactor.dart';
import 'package:flutter_template/interactor/weather/favorite/favorite_weather_interactor.dart';
import 'package:flutter_template/interactor/weather/favorite/ui_weather_list_mapper.dart';
import 'package:flutter_template/interactor/weather/search/ui_city_mapper.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:flutter_template/presentation/entity/base/ui_result.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';

class FavoriteWeatherInteractorImpl extends BaseInteractor
    implements FavoriteWeatherInteractor {
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
  Future<UIResult<void>> fetchFavouriteCitiesWeather() async {
    return mapResult(await fetchFavoriteCitiesWeatherUseCase(param: unit));
  }

  @override
  Stream<List<UICity>> getFavoriteCitiesStream() {
    return getFavoriteCitiesStreamUseCase(unit)
        .map(uiCityMapper.mapFavouriteCityList);
  }

  @override
  Stream<List<UIListItem>> getFavoriteWeatherUIList() {
    return getFavoriteCitiesWeatherStreamUseCase(unit)
        .map(weatherListMapper.map);
  }

  @override
  Future<UIResult<void>> removeCityFavorite(UICity uiCity) async {
    return mapResult(await removeFavoriteCityUseCase(
      param: uiCityMapper.mapCity(uiCity),
    ));
  }

  @override
  Future<UIResult<void>> setCityFavorite(UICity uiCity) async {
    return mapResult(await setCityFavoriteUseCase(
      param: uiCityMapper.mapCity(uiCity),
    ));
  }
}
