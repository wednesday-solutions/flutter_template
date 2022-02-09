import 'package:flutter_template/foundation/extensions/string_ext.dart';
import 'package:flutter_template/interactor/weather/favorite/favorite_weather_interactor.dart';
import 'package:flutter_template/interactor/weather/search/search_city_interactor.dart';
import 'package:flutter_template/navigation/weather/search/search_navigator.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/intl/translations/translation_keys.dart';
import 'package:flutter_template/presentation/weather/search/search_screen_state.dart';
import 'package:flutter_template/presentation/weather/search/search_view_model.dart';
import 'package:flutter_template/presentation/weather/search/search_view_model_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';
import '../../../base/test_helpers.dart';

void main() {
  late SearchNavigator searchNavigator;
  late SearchCityInteractor searchCityInteractor;
  late FavoriteWeatherInteractor favoriteWeatherInteractor;
  late SearchViewModel viewModel;

  setUpAll(baseSetupAll);

  setUp(() {
    searchNavigator = MockSearchNavigator();
    searchCityInteractor = MockSearchCityInteractor();
    favoriteWeatherInteractor = MockFavoriteWeatherInteractor();
  });

  tearDown(() {
    resetMocktailState();
  });

  _createViewModel() {
    viewModel = SearchViewModelImpl(
      searchNavigator: searchNavigator,
      searchCityInteractor: searchCityInteractor,
      favoriteWeatherInteractor: favoriteWeatherInteractor,
    );
  }

  SearchScreenState _getInitialState() => SearchScreenState(
        toolbar: UIToolbar(
          title: LocaleKeys.searchPageTitle.tr,
          hasBackButton: true,
        ),
        showLoading: false,
        searchList: List.empty(),
      );

  test(
      "Given search view model created, When no state change is made, Then initial state should be returned",
      () {
    // Given
    when(() => searchCityInteractor.searchResultsStream)
        .thenAnswer((invocation) => const Stream.empty());

    _createViewModel();

    // When
    final initialState = viewModel.debugState;

    // Then
    expect(initialState, _getInitialState());
  });
}
