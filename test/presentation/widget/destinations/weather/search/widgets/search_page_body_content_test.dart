import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/destinations/weather/search/widgets/search_page_body/search_page_body_content.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../base/widget_tester_ext.dart';

void main() {
  late TextEditingController textEditingController;

  setUp(() {
    textEditingController = TextEditingController();
  });

  tearDown(() {
    resetMocktailState();
  });

  testWidgets(
      "Given searchHint text, When search page body content is loaded, Then hint should be displayed on text field",
      (WidgetTester tester) async {
    // Given
    const searchHint = "searchHint";

    // When
    await tester.loadWidget(
      widget: SearchPageBodyContent(
        textController: textEditingController,
        searchHint: searchHint,
        child: Container(),
      ),
    );
    await tester.pump();

    // Then
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text(searchHint), findsOneWidget);
  });

  testWidgets(
      "Given search page body content is loaded, When text is entered in text field, Then text editing controlled should be updated",
      (WidgetTester tester) async {
    // Given
    const searchHint = "searchHint";
    const searchText = "searchText";

    // When
    await tester.loadWidget(
      widget: SearchPageBodyContent(
        textController: textEditingController,
        searchHint: searchHint,
        child: Container(),
      ),
    );
    await tester.pump();
    await tester.enterText(find.byType(TextField), searchText);
    await tester.pumpAndSettle();

    // Then
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text(searchHint), findsOneWidget);
    expect(find.text(searchText), findsOneWidget);
    expect(textEditingController.value.text, searchText);
  });

  testWidgets(
      "Given search page body content is loaded, When child is provided, Then child should be visible",
      (WidgetTester tester) async {
    // Given
    const childText = "Child Widget";
    const Widget child = Text(childText);

    // When
    await tester.loadWidget(
      widget: SearchPageBodyContent(
        textController: textEditingController,
        searchHint: "",
        child: child,
      ),
    );
    await tester.pump();

    // Then
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text(childText), findsOneWidget);
  });
}
