import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/destinations/weather/search/list/ui_city_list_item.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_page.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen_state.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_view_model.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';
import 'package:flutter_template/presentation/intl/translations/translation_keys.dart';
import 'package:flutter_template/presentation/intl/translations/translations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/viewmodels/fake_search_view_model.dart';
import '../../../../base/test_helpers.dart';
import '../../../../base/widget_tester_ext.dart';

void main() {
  late FakeSearchViewModel fakeSearchViewModel;

  var _fakeSearchViewModelProvider =
      StateNotifierProvider.autoDispose<SearchViewModel, SearchScreenState>(
          (ref) {
    fakeSearchViewModel = FakeSearchViewModel(SearchScreenState(
      toolbar: UIToolbar(
        title: LocaleKeys.searchPageTitle,
        hasBackButton: true,
      ),
      showLoading: false,
      searchList: List.empty(),
    ));
    return fakeSearchViewModel;
  });

  setUpAll(baseSetupAll);

  setUp(() {});

  tearDown(() {
    GetIt.instance.reset();
    resetMocktailState();
  });

  _loadPageForGolden(WidgetTester tester) async {
    await tester.loadPageForGolden(
      page: const SearchPage(searchScreen: SearchScreen()),
      viewModelProvider: searchViewModelProvider,
      fakeViewModelProvider: _fakeSearchViewModelProvider,
    );
  }

  testPageGolden(
    "Given search page is opened, When no other action is taken, Then text field and search results text should be present",
    goldenName: "search_page_default_state",
    test: (tester) async {
      // Given
      await _loadPageForGolden(tester);

      // Then
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text(englishUS[LocaleKeys.searchResultsAppearHere]),
          findsOneWidget);
      expect(find.byType(SearchPageLoadingShimmer), findsNothing);
    },
  );

  testPageGolden(
    "Given search page is opened, When showLoading is true, Then ShimmerLoading should be visible",
    goldenName: "search_page_loading",
    customPump: (tester) => tester.pump(),
    test: (tester) async {
      // Given
      await _loadPageForGolden(tester);

      // When
      fakeSearchViewModel
          .setState((state) => state.copyWith(showLoading: true));
      await tester.pump();

      // Then
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text(englishUS[LocaleKeys.searchResultsAppearHere]),
          findsNothing);
      expect(find.byType(SearchPageLoadingShimmer), findsOneWidget);
    },
  );

  testPageGolden(
    "Given search results are empty, When non empty search term is present, Then noResultsFound should be displayed",
    goldenName: "search_page_no_results",
    test: (tester) async {
      // Given
      await _loadPageForGolden(tester);

      // When
      fakeSearchViewModel
          .setState((state) => state.copyWith(showLoading: true, searchList: [
                UICity(
                  cityId: 1,
                  title: "title",
                  locationType: "locationType",
                  location: "location",
                  isFavourite: false,
                )
              ]));
      await tester.pump();
      fakeSearchViewModel.updateSearchTerm("newTerm");
      fakeSearchViewModel.setState((state) => state.copyWith(
            showLoading: false,
            searchList: List.empty(),
          ));
      await tester.pump();

      // Then
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text(englishUS[LocaleKeys.searchResultsAppearHere]),
          findsNothing);
      expect(find.byType(SearchPageLoadingShimmer), findsNothing);
      expect(find.text(englishUS[LocaleKeys.noResultsFound]), findsOneWidget);
    },
  );

  testPageGolden(
    "Given search results are not empty, When non empty search term is present, Then results should be displayed",
    goldenName: "search_page_results",
    test: (tester) async {
      // Given
      await _loadPageForGolden(tester);

      // When
      fakeSearchViewModel
          .setState((state) => state.copyWith(showLoading: false, searchList: [
                UICity(
                  cityId: 1,
                  title: "title",
                  locationType: "locationType",
                  location: "location",
                  isFavourite: false,
                ),
                UICity(
                  cityId: 2,
                  title: "title 2",
                  locationType: "locationType 2",
                  location: "location 2",
                  isFavourite: false,
                ),
              ]));
      await tester.pumpAndSettle();

      // Then
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text(englishUS[LocaleKeys.searchResultsAppearHere]),
          findsNothing);
      expect(find.byType(SearchPageLoadingShimmer), findsNothing);
      expect(find.text(englishUS[LocaleKeys.noResultsFound]), findsNothing);
      expect(find.byType(UICityListItem), findsNWidgets(2));
    },
  );

  testPageGolden(
    "Given search list is displayed, When a city is marked as favorite, Then the icon is in selected state",
    goldenName: "search_page_favorite_icon",
    test: (tester) async {
      // Given
      await _loadPageForGolden(tester);
      final uiCityList = [
        UICity(
          cityId: 1,
          title: "title",
          locationType: "locationType",
          location: "location",
          isFavourite: true,
        ),
        UICity(
          cityId: 2,
          title: "title 2",
          locationType: "locationType 2",
          location: "location 2",
          isFavourite: false,
        ),
      ];

      // When
      fakeSearchViewModel.setState((state) =>
          state.copyWith(showLoading: false, searchList: uiCityList));
      await tester.pump();

      // Then
      expect(find.byIcon(Icons.favorite), findsOneWidget);
    },
  );
}
