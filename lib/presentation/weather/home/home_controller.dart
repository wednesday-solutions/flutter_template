import 'package:flutter_template/interactor/weather/favorite/favorite_weather_interactor.dart';
import 'package:flutter_template/navigation/weather/home/home_navigator.dart';
import 'package:flutter_template/presentation/base/controller/base_controller.dart';
import 'package:flutter_template/presentation/base/intent/intent_handler.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/intl/strings.dart';
import 'package:flutter_template/presentation/weather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/weather/home/home_screen_state.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class HomeController extends BaseController<HomeScreen, HomeScreenState>
    implements IntentHandler<HomeScreenIntent> {
  final FavoriteWeatherInteractor favoriteWeatherInteractor;
  final HomeNavigator homeNavigator;

  HomeController({
    required this.favoriteWeatherInteractor,
    required this.homeNavigator,
  });

  @override
  HomeScreenState getDefaultState() => HomeScreenState(
        toolbar: UIToolbar(
          title: Strings.homePageTitle.tr,
          hasBackButton: false,
        ),
        showLoading: false,
        weatherList: List.empty(),
      );

  @override
  void onInit() {
    super.onInit();

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
