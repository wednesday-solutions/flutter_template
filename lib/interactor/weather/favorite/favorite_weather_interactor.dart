import 'package:flutter_template/core/entity/result.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';

abstract interface class FavoriteWeatherInteractor {
  Future<Result<void>> setCityFavorite(UICity uiCity);

  Future<Result<void>> removeCityFavorite(UICity uiCity);

  Stream<List<UIListItem>> getFavoriteWeatherUIList();

  Stream<List<UICity>> getFavoriteCitiesStream();

  Future<Result<void>> fetchFavouriteCitiesWeather();
}
