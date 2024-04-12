import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_page.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen_state.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_view_model.dart';
import 'package:flutter_template/presentation/destinations/weather/search/widgets/list/ui_city_list_item.dart';
import 'package:flutter_template/presentation/destinations/weather/search/widgets/search_page_loading_shimmer/search_page_loading_shimmer.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
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

  setUpAll(baseSetupAll);

  setUp(() {});

  tearDown(() {
    GetIt.instance.reset();
    resetMocktailState();
  });

  loadPage(WidgetTester tester) async {
    await tester.loadPage(
      widget: const SearchPage(searchScreen: SearchScreen()),
      viewModelProvider: searchViewModelProvider,
      fakeViewModelGenerator: (ref) {
        fakeSearchViewModel = FakeSearchViewModel(
          SearchScreenState(
            toolbar: UIToolbar(
                title: LocaleKeys.searchPageTitle, hasBackButton: true),
            showLoading: false,
            searchList: List.empty(),
          ),
        );
        return fakeSearchViewModel;
      },
    );
  }

  testWidgets(
      "Given search page is opened, When no other action is taken, Then text field and search results text should be present",
      (tester) async {
    // Given
    await loadPage(tester);

    // Then
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text(LocaleKeys.searchResultsAppearHere), findsOneWidget);
    expect(find.byType(SearchPageLoadingShimmer), findsNothing);
  });

  testWidgets(
      "Given search page is opened, When showLoading is true, Then ShimmerLoading should be visible",
      (tester) async {
    // Given
    await loadPage(tester);

    // When
    fakeSearchViewModel.setState((state) => state.copyWith(showLoading: true));
    await tester.pump();

    // Then
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text(LocaleKeys.searchResultsAppearHere), findsNothing);
    expect(find.byType(SearchPageLoadingShimmer), findsOneWidget);
  });

  testWidgets(
      "Given search results are empty, When non empty search term is present, Then noResultsFound should be displayed",
      (tester) async {
    // Given
    await loadPage(tester);

    // When
    fakeSearchViewModel
        .setState((state) => state.copyWith(showLoading: true, searchList: [
              UICity(
                cityId: 1,
                title: "title",
                locationType: "locationType",
                location: "location",
                isFavourite: false,
                state: '',
                displayTitle: '',
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
    expect(find.text(LocaleKeys.searchResultsAppearHere), findsNothing);
    expect(find.byType(SearchPageLoadingShimmer), findsNothing);
    expect(find.text(LocaleKeys.noResultsFound), findsOneWidget);
  });

  testWidgets(
      "Given search results are not empty, When non empty search term is present, Then results should be displayed",
      (tester) async {
    // Given
    await loadPage(tester);

    // When
    fakeSearchViewModel
        .setState((state) => state.copyWith(showLoading: false, searchList: [
              UICity(
                cityId: 1,
                title: "title",
                locationType: "locationType",
                location: "location",
                isFavourite: false,
                state: '',
                displayTitle: '',
              ),
              UICity(
                cityId: 2,
                title: "title 2",
                locationType: "locationType 2",
                location: "location 2",
                isFavourite: false,
                state: '',
                displayTitle: '',
              ),
            ]));
    await tester.pumpAndSettle();

    // Then
    expect(find.byType(TextField), findsOneWidget);
    expect(
        find.text(englishUS[LocaleKeys.searchResultsAppearHere]), findsNothing);
    expect(find.byType(SearchPageLoadingShimmer), findsNothing);
    expect(find.text(englishUS[LocaleKeys.noResultsFound]), findsNothing);
    expect(find.byType(UICityListItem), findsNWidgets(2));
  });

  testWidgets(
      "Given search list is displayed, When a city is marked as favorite, Then the icon is in selected state",
      (tester) async {
    // Given
    await loadPage(tester);
    final uiCityList = [
      UICity(
        cityId: 1,
        title: "title",
        locationType: "locationType",
        location: "location",
        isFavourite: true,
        state: '',
        displayTitle: '',
      ),
      UICity(
        cityId: 2,
        title: "title 2",
        locationType: "locationType 2",
        location: "location 2",
        isFavourite: false,
        state: '',
        displayTitle: '',
      ),
    ];

    // When
    fakeSearchViewModel.setState(
        (state) => state.copyWith(showLoading: false, searchList: uiCityList));
    await tester.pump();

    // Then
    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });

  testWidgets(
      "Given search page opened, When text is entered in text field, Then search intent is fired",
      (tester) async {
    // Given
    await loadPage(tester);

    // When
    await tester.enterText(find.byType(TextField), "search");
    await tester.pump();

    // Then
    verify(() => fakeSearchViewModel
        .onIntent(const SearchSearchScreenIntent(searchTerm: "search"))).called(1);
  });

  testWidgets(
      "Given search page is opened, When back button is pressed, Then back intent is fired",
      (tester) async {
    // Given
    await loadPage(tester);

    // When

    await tester.tap(find.byTooltip("Back"));
    await tester.pump();

    // Then
    verify(() => fakeSearchViewModel.onIntent(const BackSearchScreenIntent()))
        .called(1);
  });

  testWidgets(
      "Given search list is displayed, When favorite is pressed, Then favorite intent is fired",
      (tester) async {
    // Given
    await loadPage(tester);
    final uiCityList = [
      UICity(
        cityId: 1,
        title: "title",
        locationType: "locationType",
        location: "location",
        isFavourite: false,
        displayTitle: '',
        state: '',
      ),
      UICity(
        cityId: 2,
        title: "title 2",
        locationType: "locationType 2",
        location: "location 2",
        isFavourite: false,
        displayTitle: '',
        state: '',
      ),
    ];

    // When
    fakeSearchViewModel.setState(
        (state) => state.copyWith(showLoading: false, searchList: uiCityList));
    await tester.pump();
    await tester.tap(find
        .descendant(
            of: find.byType(UICityListItem), matching: find.byType(IconButton))
        .first);
    await tester.pump();
    await tester.tap(find
        .descendant(
            of: find.byType(UICityListItem), matching: find.byType(IconButton))
        .last);
    await tester.pump();

    // Then
    verify(() => fakeSearchViewModel.onIntent(
        ToggleFavoriteSearchScreenIntent(city: uiCityList.first))).called(1);
    verify(() => fakeSearchViewModel.onIntent(
        ToggleFavoriteSearchScreenIntent(city: uiCityList.last))).called(1);
  });
}
