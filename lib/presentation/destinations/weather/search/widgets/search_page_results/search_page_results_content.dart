import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/intent/intent_handler_callback.dart';
import 'package:flutter_template/presentation/base/widgets/list/ui_list.dart';
import 'package:flutter_template/presentation/base/widgets/responsive/responsive_builder.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/weather/search/widgets/list/ui_city_renderer.dart';
import 'package:flutter_template/presentation/destinations/weather/search/widgets/search_page_loading_shimmer/search_page_loading_shimmer.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';

class SearchPageResultsContent extends StatelessWidget {
  final bool showLoading;
  final List<UIListItem> searchList;
  final String searchTerm;
  final IntentHandlerCallback<SearchScreenIntent> intentHandlerCallback;
  final String searchResultsPlaceholder;
  final String noResultsPlaceholder;

  const SearchPageResultsContent({
    super.key,
    required this.showLoading,
    required this.searchList,
    required this.searchTerm,
    required this.intentHandlerCallback,
    required this.searchResultsPlaceholder,
    required this.noResultsPlaceholder,
  });

  @override
  Widget build(BuildContext context) {
    if (!showLoading && searchList.isEmpty) {
      return Expanded(
        child: Center(
          child: searchTerm.isEmpty
              ? Text(searchResultsPlaceholder)
              : Text(noResultsPlaceholder),
        ),
      );
    }

    if (showLoading) {
      return const SearchPageLoadingShimmer();
    } else {
      return Expanded(
        child: ResponsiveBuilder(
          builder: (context, mediaQueryData, boxConstraints) {
            return UIList<SearchScreenIntent>(
              renderers: const {
                UICity: UICityRenderer(),
              },
              items: searchList,
              numberOfColumns:
                  mediaQueryData.orientation == Orientation.landscape ? 5 : 1,
              intentHandler: intentHandlerCallback,
            );
          },
        ),
      );
    }
  }
}
