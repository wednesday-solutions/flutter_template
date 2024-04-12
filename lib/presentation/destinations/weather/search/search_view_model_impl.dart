import 'package:flutter_template/foundation/extensions/string_ext.dart';
import 'package:flutter_template/interactor/weather/favorite/favorite_weather_interactor.dart';
import 'package:flutter_template/interactor/weather/search/search_city_interactor.dart';
import 'package:flutter_template/navigation/weather/search/search_navigator.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen_state.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_view_model.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/intl/translations/translation_keys.dart';
import 'package:rxdart/rxdart.dart';

class SearchViewModelImpl extends SearchViewModel {
  final SearchNavigator searchNavigator;
  final SearchCityInteractor searchCityInteractor;
  final FavoriteWeatherInteractor favoriteWeatherInteractor;
  final _searchTermSubject = BehaviorSubject.seeded("");

  @override
  String get searchTerm =>
      _searchTermSubject.hasValue ? _searchTermSubject.value : "";

  SearchViewModelImpl({
    required this.searchNavigator,
    required this.searchCityInteractor,
    required this.favoriteWeatherInteractor,
  }) : super(_initialState);

  @override
  void onInit() {
    listen<List<UIListItem>>(
        stream: searchCityInteractor.searchResultsStream,
        onData: (data) {
          setState((state) => state.copyWith(searchList: data));
        });

    listenDebounce<String>(
        stream: _searchTermSubject,
        debounceDuration: const Duration(milliseconds: 400),
        onData: (newSearchTerm) async {
          if (newSearchTerm.isNotEmpty && newSearchTerm.isBlank != true) {
            setState((state) => state.copyWith(showLoading: true));
            await searchCityInteractor.search(newSearchTerm);
            setState((state) => state.copyWith(showLoading: false));
          } else {
            setState((state) => state.copyWith(searchList: List.empty()));
          }
        });
  }

  static SearchScreenState get _initialState => SearchScreenState(
        toolbar: UIToolbar(
          title: LocaleKeys.searchPageTitle,
          hasBackButton: true,
        ),
        showLoading: false,
        searchList: List.empty(),
      );

  @override
  Future<void> onIntent(SearchScreenIntent intent) async {
    switch (intent) {
      case BackSearchScreenIntent():
        searchNavigator.back();
      case SearchSearchScreenIntent():
        if (intent.searchTerm != searchTerm) {
          _searchTermSubject.add(intent.searchTerm);
        }
      case ToggleFavoriteSearchScreenIntent():
        if (intent.city.isFavourite) {
          await favoriteWeatherInteractor.removeCityFavorite(intent.city);
        } else {
          await favoriteWeatherInteractor.setCityFavorite(intent.city);
        }
    }
  }
}
