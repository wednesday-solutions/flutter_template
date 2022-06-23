import 'package:foundation/foundation.dart';
import 'package:interactor/interactor.dart';
import 'package:presentation/base/translation/translation_ext.dart';
import 'package:presentation/destinations/weather/search/search_screen_intent.dart';
import 'package:presentation/destinations/weather/search/search_view_model.dart';
import 'package:presentation/intl/translations/translation_keys.dart';
import 'package:presentation/navigation/weather/search/search_navigator.dart';
import 'package:presentation_entity/presentation_entity.dart';
import 'package:rxdart/rxdart.dart';

import 'search_screen_state.dart';

class SearchViewModelImpl extends SearchViewModel {
  final SearchNavigator searchNavigator;
  final SearchCityInteractor searchCityInteractor;
  final FavoriteWeatherInteractor favoriteWeatherInteractor;
  final _searchTermSubject = BehaviorSubject.seeded("");

  @override
  String get searchTerm => _searchTermSubject.hasValue ? _searchTermSubject.value : "";

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
          title: LocaleKeys.searchPageTitle.tr,
          hasBackButton: true,
        ),
        showLoading: false,
        searchList: List.empty(),
      );

  @override
  void onIntent(SearchScreenIntent intent) {
    intent.when(
      back: () => searchNavigator.back(),
      search: (newSearchTerm) {
        if (newSearchTerm != searchTerm) {
          _searchTermSubject.add(newSearchTerm);
        }
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
