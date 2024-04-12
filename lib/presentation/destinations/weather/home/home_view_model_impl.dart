import 'package:flutter_template/interactor/weather/favorite/favorite_weather_interactor.dart';
import 'package:flutter_template/navigation/weather/home/home_navigator.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_screen_state.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_view_model.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/intl/translations/translation_keys.dart';

class HomeViewModelImpl extends HomeViewModel {
  final FavoriteWeatherInteractor favoriteWeatherInteractor;
  final HomeNavigator homeNavigator;

  HomeViewModelImpl({
    required this.favoriteWeatherInteractor,
    required this.homeNavigator,
  }) : super(_initialState);

  static get _initialState => HomeScreenState(
        toolbar: UIToolbar(
          title: LocaleKeys.homePageTitle,
          hasBackButton: false,
        ),
        showLoading: false,
        weatherList: List.empty(),
      );

  @override
  void onInit() {
    listen(
        stream: favoriteWeatherInteractor.getFavoriteCitiesStream(),
        onData: (data) {
          favoriteWeatherInteractor.fetchFavouriteCitiesWeather();
        });

    listen<List<UIListItem>>(
      stream: favoriteWeatherInteractor.getFavoriteWeatherUIList(),
      onData: (data) {
        setState((state) => state.copyWith(weatherList: data));
      },
    );

    favoriteWeatherInteractor.fetchFavouriteCitiesWeather();
  }

  @override
  void onIntent(HomeScreenIntent intent) {
    switch (intent) {
      case SearchHomeScreenIntent():
        homeNavigator.toSearchScreen();
    }
  }
}
