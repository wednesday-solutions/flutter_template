import 'package:domain/domain.dart';
import 'package:foundation/foundation.dart';
import 'package:interactor/interface/weather/favorite/favorite_weather_interactor.dart';
import 'package:interactor/src/weather/favorite/ui_weather_list_mapper.dart';
import 'package:interactor/src/weather/search/ui_city_mapper.dart';
import 'package:presentation_entity/presentation_entity.dart';

class FavoriteWeatherInteractorImpl implements FavoriteWeatherInteractor {
  final FetchFavoriteCitiesWeatherUseCase fetchFavoriteCitiesWeatherUseCase;
  final GetFavoriteCitiesStreamUseCase getFavoriteCitiesStreamUseCase;
  final SetCityFavoriteUseCase setCityFavoriteUseCase;
  final RemoveFavoriteCityUseCase removeFavoriteCityUseCase;
  final GetFavoriteCitiesWeatherStreamUseCase getFavoriteCitiesWeatherStreamUseCase;
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
  Future<Result<void>> fetchFavouriteCitiesWeather() {
    logD("fetchFavouriteCitiesWeather");
    return fetchFavoriteCitiesWeatherUseCase(param: unit);
  }

  @override
  Stream<List<UICity>> getFavoriteCitiesStream() {
    logD("getFavoriteCitiesStream");
    return getFavoriteCitiesStreamUseCase(unit).map(uiCityMapper.mapFavouriteCityList);
  }

  @override
  Stream<List<UIListItem>> getFavoriteWeatherUIList() {
    logD("getFavoriteWeatherUIList");
    return getFavoriteCitiesWeatherStreamUseCase(unit).map(weatherListMapper.map);
  }

  @override
  Future<Result<void>> removeCityFavorite(UICity uiCity) {
    logD("removeCityFavorite: uiCity = $uiCity");
    return removeFavoriteCityUseCase(
      param: uiCityMapper.mapCity(uiCity),
    );
  }

  @override
  Future<Result<void>> setCityFavorite(UICity uiCity) {
    logD("setCityFavorite: uiCity = $uiCity");
    return setCityFavoriteUseCase(
      param: uiCityMapper.mapCity(uiCity),
    );
  }
}
