import 'package:flutter_template/interactor/weather/favorite/favorite_weather_interactor.dart';
import 'package:flutter_template/interactor/weather/search/search_city_interactor.dart';
import 'package:flutter_template/navigation/weather/search/search_navigator.dart';
import 'package:flutter_template/presentation/base/controller/base_controller.dart';
import 'package:flutter_template/presentation/base/intent/intent_handler.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';
import 'package:flutter_template/presentation/intl/strings.dart';
import 'package:flutter_template/presentation/weather/search/search_screen_intent.dart';
import 'package:flutter_template/presentation/weather/search/search_screen_state.dart';
import 'package:get/get.dart';

class SearchController extends BaseController<SearchScreen, SearchScreenState>
    implements IntentHandler<SearchScreenIntent> {
  final SearchNavigator searchNavigator;
  final SearchCityInteractor searchCityInteractor;
  final FavoriteWeatherInteractor favoriteWeatherInteractor;
  final _searchTerm = "".obs;
  String get searchTerm => _searchTerm.value;

  SearchController({
    required this.searchNavigator,
    required this.searchCityInteractor,
    required this.favoriteWeatherInteractor,
  });

  @override
  void onInit() {
    super.onInit();

    listen<List<UIListItem>>(
        stream: searchCityInteractor.searchResultsStream,
        onData: (data) {
          setState((state) => state.copyWith(searchList: data));
        });

    debounce<String>(
      _searchTerm,
      (searchString) async {
        if (searchString.isNotEmpty && searchString.isBlank != true) {
          setState((state) => state.copyWith(showLoading: true));
          await searchCityInteractor.search(searchString);
          setState((state) => state.copyWith(showLoading: false));
        } else {
          setState((state) => state.copyWith(searchList: List.empty()));
        }
      },
      time: const Duration(milliseconds: 400),
    );
  }

  @override
  SearchScreenState getDefaultState() => SearchScreenState(
        toolbar: UIToolbar(
          title: Strings.searchPageTitle.tr,
          hasBackButton: true,
        ),
        showLoading: false,
        searchList: List.empty(),
      );

  @override
  void onIntent(SearchScreenIntent intent) {
    intent.when(
      back: () => searchNavigator.back(),
      search: (searchTerm) {
        _searchTerm.value = searchTerm;
      },
      toggleFavorite: (UICity city) async {
        if (city.isFavourite) {
          await favoriteWeatherInteractor.removeCityFavorite(city);
        } else {
          await favoriteWeatherInteractor.setCityFavorite(city);
        }
      },
    );
  }
}
