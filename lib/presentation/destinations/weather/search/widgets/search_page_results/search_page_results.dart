import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/foundation/extensions/context_ext.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_view_model.dart';
import 'package:flutter_template/presentation/destinations/weather/search/widgets/search_page_results/search_page_results_content.dart';
import 'package:flutter_template/presentation/intl/translations/translation_keys.dart';
import 'package:tuple/tuple.dart';

class SearchPageResults extends ConsumerWidget {
  const SearchPageResults({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(searchViewModelProvider.notifier);
    final loadingToSearchListPair = ref.watch(searchViewModelProvider
        .select((value) => Tuple2(value.showLoading, value.searchList)));

    final showLoading = loadingToSearchListPair.item1;
    final searchList = loadingToSearchListPair.item2;

    return SearchPageResultsContent(
      showLoading: showLoading,
      searchList: searchList,
      searchTerm: viewModel.searchTerm,
      intentHandlerCallback: viewModel.onIntent,
      searchResultsPlaceholder: context.tr(LocaleKeys.searchResultsAppearHere),
      noResultsPlaceholder: context.tr(LocaleKeys.noResultsFound),
    );
  }
}
