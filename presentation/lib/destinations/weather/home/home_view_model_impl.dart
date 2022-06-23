import 'package:interactor/interactor.dart';
import 'package:presentation/base/translation/translation_ext.dart';
import 'package:presentation/destinations/weather/home/home_screen_intent.dart';
import 'package:presentation/destinations/weather/home/home_screen_state.dart';
import 'package:presentation/destinations/weather/home/home_view_model.dart';
import 'package:presentation/intl/translations/translation_keys.dart';
import 'package:presentation/navigation/weather/home/home_navigator.dart';
import 'package:presentation_entity/presentation_entity.dart';

class HomeViewModelImpl extends HomeViewModel {
  final FavoriteWeatherInteractor favoriteWeatherInteractor;
  final HomeNavigator homeNavigator;

  HomeViewModelImpl({
    required this.favoriteWeatherInteractor,
    required this.homeNavigator,
  }) : super(_initialState);

  static get _initialState => HomeScreenState(
        toolbar: UIToolbar(
          title: LocaleKeys.homePageTitle.tr,
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
    intent.when(
      search: () {
        homeNavigator.toSearchScreen();
      },
    );
  }
}
