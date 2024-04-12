import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/weather/search/widgets/list/ui_city_list_item.dart';
import 'package:flutter_template/presentation/destinations/weather/search/widgets/search_page_loading_shimmer/search_page_loading_shimmer.dart';
import 'package:flutter_template/presentation/destinations/weather/search/widgets/search_page_results/search_page_results_content.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../mocks/mocks.dart';
import '../../../../../../test_models/ui_city_models.dart';
import '../../../../../base/widget_tester_ext.dart';

void main() {
  late MockIntentHandler intentHandler;

  setUp(() {
    intentHandler = MockIntentHandler();
  });

  loadWidget(WidgetTester tester, SearchPageResultsContent widget) async {
    await tester.loadWidget(
      widget: Flex(
        direction: Axis.vertical,
        children: [
          widget,
        ],
      ),
    );
  }

  tearDown(() {
    resetMocktailState();
  });

  testWidgets(
      "Given showLoading is true, When no results are present, Then loading shimmer should be visible",
      (tester) async {
    // Given
    await loadWidget(
      tester,
      SearchPageResultsContent(
        showLoading: true,
        searchList: const [],
        searchTerm: "",
        intentHandlerCallback: (_) {},
        searchResultsPlaceholder: "",
        noResultsPlaceholder: "",
      ),
    );

    // When

    // Then
    expect(find.byType(SearchPageLoadingShimmer), findsOneWidget);
    expect(find.byType(Text), findsNothing);
  });

  testWidgets(
      "Given showLoading is true, When results are present, Then loading shimmer should be visible",
      (tester) async {
    // Given
    await loadWidget(
      tester,
      SearchPageResultsContent(
        showLoading: true,
        searchList: searchList,
        searchTerm: "",
        intentHandlerCallback: (_) {},
        searchResultsPlaceholder: "",
        noResultsPlaceholder: "",
      ),
    );

    // When

    // Then
    expect(find.byType(SearchPageLoadingShimmer), findsOneWidget);
    expect(find.byType(Text), findsNothing);
  });

  testWidgets(
      "Given showLoading is false, When results are present, Then results should be displayed",
      (tester) async {
    // Given
    await loadWidget(
      tester,
      SearchPageResultsContent(
        showLoading: false,
        searchList: searchList,
        searchTerm: "",
        intentHandlerCallback: (_) {},
        searchResultsPlaceholder: "",
        noResultsPlaceholder: "",
      ),
    );

    // When

    // Then
    expect(find.byType(SearchPageLoadingShimmer), findsNothing);
    expect(find.byType(UICityListItem), findsNWidgets(2));
  });

  testWidgets(
      "Given showLoading is false and list is empty, When search term is empty, Then search results placeholder should be displayed",
      (tester) async {
    // Given
    const searchResultsPlaceholder = "searchResultsPlaceholder";
    await loadWidget(
      tester,
      SearchPageResultsContent(
        showLoading: false,
        searchList: const [],
        searchTerm: "",
        intentHandlerCallback: (_) {},
        searchResultsPlaceholder: searchResultsPlaceholder,
        noResultsPlaceholder: "",
      ),
    );

    // When

    // Then
    expect(find.byType(SearchPageLoadingShimmer), findsNothing);
    expect(find.byType(UICityListItem), findsNothing);
    expect(find.text(searchResultsPlaceholder), findsOneWidget);
  });

  testWidgets(
      "Given showLoading is false and list is empty, When search term is not empty, Then no results placeholder should be displayed",
      (tester) async {
    // Given
    const noResultsPlaceholder = "noResultsPlaceholder";
    await loadWidget(
      tester,
      SearchPageResultsContent(
        showLoading: false,
        searchList: const [],
        searchTerm: "searchTerm",
        intentHandlerCallback: (_) {},
        searchResultsPlaceholder: "",
        noResultsPlaceholder: noResultsPlaceholder,
      ),
    );

    // When

    // Then
    expect(find.byType(SearchPageLoadingShimmer), findsNothing);
    expect(find.byType(UICityListItem), findsNothing);
    expect(find.text(noResultsPlaceholder), findsOneWidget);
  });

  testWidgets(
      "Given search list is not empty, When favorite icon is tapped, Then intent handler callback is called with correct intent",
      (tester) async {
    // Given
    await loadWidget(
      tester,
      SearchPageResultsContent(
        showLoading: false,
        searchList: searchList,
        searchTerm: "searchTerm",
        intentHandlerCallback: intentHandler.onIntent,
        searchResultsPlaceholder: "",
        noResultsPlaceholder: "",
      ),
    );

    // When
    await tester.tap(find.byIcon(Icons.favorite_border));
    await tester.pumpAndSettle();

    // Then
    verify(
      () => intentHandler.onIntent(
        ToggleFavoriteSearchScreenIntent(
          city: searchList.first,
        ),
      ),
    ).called(1);
  });
}
