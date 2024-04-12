import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/foundation/extensions/context_ext.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_view_model.dart';
import 'package:flutter_template/presentation/destinations/weather/search/widgets/search_page_body/search_page_body_content.dart';
import 'package:flutter_template/presentation/destinations/weather/search/widgets/search_page_results/search_page_results.dart';
import 'package:flutter_template/presentation/intl/translations/translation_keys.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchPageBody extends HookConsumerWidget {
  const SearchPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController =
        useTextEditingController.fromValue(TextEditingValue.empty);

    textController.addListener(() {
      final viewModel = ref.read(searchViewModelProvider.notifier);
      viewModel.onIntent(SearchSearchScreenIntent(
        searchTerm: textController.text,
      ));
    });

    return SearchPageBodyContent(
      textController: textController,
      searchHint: context.tr(LocaleKeys.startTypingToSearch),
      child: const SearchPageResults(),
    );
  }
}
