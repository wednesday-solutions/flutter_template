import 'dart:async';

import 'package:flutter_template/core/entity/result.dart';
import 'package:flutter_template/interactor/weather/favorite/favorite_weather_interactor.dart';
import 'package:flutter_template/interactor/weather/search/search_city_interactor.dart';
import 'package:flutter_template/navigation/weather/search/search_navigator.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen_state.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_view_model.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_view_model_impl.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/intl/translations/translation_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../extensions/mock_extensions.dart';
import '../../../../../extensions/stream_extensions.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../test_models/ui_city_models.dart';
import '../../../../base/test_helpers.dart';

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

  createViewModel() {
    viewModel = SearchViewModelImpl(
      searchNavigator: searchNavigator,
      searchCityInteractor: searchCityInteractor,
      favoriteWeatherInteractor: favoriteWeatherInteractor,
    );
  }

  SearchScreenState getInitialState() => SearchScreenState(
        toolbar: UIToolbar(
          title: LocaleKeys.searchPageTitle,
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

    createViewModel();

    // When
    final initialState = viewModel.state;

    // Then
    expect(initialState, getInitialState());
  });

  test(
      "Given search view model created, When on init is called, Then view model should listen to search results stream",
      () async {
    // Given
    final uiCityList = [uiCity];
    when(() => searchCityInteractor.searchResultsStream)
        .thenAnswer((_) => Stream.value(uiCityList));

    // When
    createViewModel();

    // Then
    viewModel.stream.inOrder([
      emits(getInitialState().copyWith(searchList: uiCityList)),
    ]);
  });

  test(
      "Given search view model created, When on init is called, Then view model should listen to search term stream",
      () async {
    // Given
    const searchTerm = "Pune";
    when(() => searchCityInteractor.searchResultsStream)
        .thenReturnEmptyListStream();
    when(() => searchCityInteractor.search(searchTerm)).justRun();

    // When
    createViewModel();

    viewModel.stream.inOrder([
      // Then
      emits(getInitialState().copyWith(showLoading: true)),
      emits(getInitialState().copyWith(showLoading: false)),
    ]);

    viewModel.onIntent(const SearchSearchScreenIntent(searchTerm: searchTerm));
  });

  test(
      "Given user types search query, When multiple queries come in rapidly, Then api call should not be made for every query",
      () async {
    // Given
    const searchTerm1 = "P";
    const searchTerm2 = "Pu";
    const searchTerm3 = "Pun";
    const searchTerm4 = "Pune";
    when(() => searchCityInteractor.searchResultsStream)
        .thenReturnEmptyListStream();
    when(() => searchCityInteractor.search(searchTerm4)).justRun();

    // When
    createViewModel();

    viewModel.stream.inOrder([
      emits(getInitialState().copyWith(showLoading: true)),
      emits(getInitialState().copyWith(showLoading: false)),
    ]);

    viewModel.onIntent(const SearchSearchScreenIntent(searchTerm: searchTerm1));
    viewModel.onIntent(const SearchSearchScreenIntent(searchTerm: searchTerm2));
    viewModel.onIntent(const SearchSearchScreenIntent(searchTerm: searchTerm3));
    viewModel.onIntent(const SearchSearchScreenIntent(searchTerm: searchTerm4));

    // Then
    // Make sure no calls happen instantly
    verifyNever(() => searchCityInteractor.search(any()));
    // Wait for debounce duration to pass
    await Future.delayed(const Duration(milliseconds: 500));
    // Verify only 1 call was made with the latest values after debounce
    verify(() => searchCityInteractor.search(searchTerm4)).called(1);
  });

  test(
      "Given search page is open, When back intent is fired, Then back should be called on search navigator",
      () {
    // Given
    when(() => searchCityInteractor.searchResultsStream)
        .thenReturnEmptyListStream();
    createViewModel();

    // When
    viewModel.onIntent(const BackSearchScreenIntent());

    // Then
    verify(() => searchNavigator.back()).called(1);
  });

  test(
      "Given toggleFavorite intent is fired, When city is not favorite, Then city should be marked as favorite",
      () {
    // Given
    final city = uiCity;
    when(() => searchCityInteractor.searchResultsStream)
        .thenReturnEmptyListStream();
    when(() => favoriteWeatherInteractor.setCityFavorite(city))
        .thenAnswer((_) async => const Success<void>(data: null));
    createViewModel();

    // When
    viewModel.onIntent(ToggleFavoriteSearchScreenIntent(city: city));

    // Then
    verify(() => favoriteWeatherInteractor.setCityFavorite(city)).called(1);
    verifyNever(() => favoriteWeatherInteractor.removeCityFavorite(city));
  });

  test(
      "Given toggleFavorite intent is fired, When city is favorite, Then city should be removed as favorite",
      () {
    // Given
    final city = uiCity.copyWith(isFavourite: true);
    when(() => searchCityInteractor.searchResultsStream)
        .thenReturnEmptyListStream();
    when(() => favoriteWeatherInteractor.removeCityFavorite(city))
        .thenAnswer((_) async => const Success<void>(data: null));
    createViewModel();

    // When
    viewModel.onIntent(ToggleFavoriteSearchScreenIntent(city: city));

    // Then
    verify(() => favoriteWeatherInteractor.removeCityFavorite(city)).called(1);
    verifyNever(() => favoriteWeatherInteractor.setCityFavorite(city));
  });
}
