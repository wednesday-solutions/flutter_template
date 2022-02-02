import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/foundation/extensions/string_ext.dart';
import 'package:flutter_template/interactor/weather/favorite/favorite_weather_interactor.dart';
import 'package:flutter_template/navigation/weather/home/home_navigator.dart';
import 'package:flutter_template/presentation/base/controller/base_view_model.dart';
import 'package:flutter_template/presentation/base/intent/intent_handler.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/intl/translations/translation_keys.dart';

import 'package:flutter_template/presentation/weather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/weather/home/home_screen_state.dart';
import 'package:get_it/get_it.dart';

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeScreenState>(
        (ref) => GetIt.I.get());

class HomeViewModel extends BaseViewModel<HomeScreen, HomeScreenState>
    implements IntentHandler<HomeScreenIntent> {
  final FavoriteWeatherInteractor favoriteWeatherInteractor;
  final HomeNavigator homeNavigator;

  HomeViewModel({
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
    intent.when(search: () {
      homeNavigator.toSearchScreen();
    });
  }
}
