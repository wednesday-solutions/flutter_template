import 'package:foundation/foundation.dart';
import 'package:presentation_entity/presentation_entity.dart';

abstract class FavoriteWeatherInteractor {
  Future<Result<void>> setCityFavorite(UICity uiCity);

  Future<Result<void>> removeCityFavorite(UICity uiCity);

  Stream<List<UIListItem>> getFavoriteWeatherUIList();

  Stream<List<UICity>> getFavoriteCitiesStream();

  Future<Result<void>> fetchFavouriteCitiesWeather();
}
