import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/foundation/extensions/string_ext.dart';
import 'package:flutter_template/presentation/base/exceptions/unhandled_effect_exception.dart';
import 'package:flutter_template/presentation/base/page/base_page.dart';
import 'package:flutter_template/presentation/base/widgets/list/ui_list.dart';
import 'package:flutter_template/presentation/base/widgets/responsive/responsive_builder.dart';
import 'package:flutter_template/presentation/base/widgets/snackbar/snackbar.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen_state.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_view_model.dart';
import 'package:flutter_template/presentation/entity/effect/effect.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';
import 'package:flutter_template/presentation/intl/translations/translation_keys.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter_template/presentation/destinations/weather/search/list/ui_city_renderer.dart';

class SearchPage extends StatelessWidget {
  final SearchScreen searchScreen;

  const SearchPage({Key? key, required this.searchScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage<SearchScreen, SearchScreenState, SearchViewModel>(
      hideDefaultLoading: true,
      viewModelProvider: searchViewModelProvider,
      screen: searchScreen,
      onAppBarBackPressed: (viewModel) => viewModel.onIntent(
        SearchScreenIntent.back(),
      ),
      body: const _SearchPageBody(),
      onEffect: _handleEffect,
    );
  }

  _handleEffect(Effect effect) {
    effect.maybeMap(
      snackBar: (snackbarEffect) {
        showSnackbar(snackbarEffect);
      },
      orElse: () => throw UnhandledEffectException(effect),
    );
  }
}

class _SearchPageBody extends HookConsumerWidget {
  const _SearchPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController =
        useTextEditingController.fromValue(TextEditingValue.empty);

    textController.addListener(() {
      final viewModel = ref.read(searchViewModelProvider.notifier);
      viewModel.onIntent(SearchScreenIntent.search(
        searchTerm: textController.text,
      ));
    });

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Flex(
        direction: Axis.vertical,
        children: [
          TextField(
            controller: textController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: LocaleKeys.startTypingToSearch.tr,
            ),
          ),
          const _SearchPageResults(),
        ],
      ),
    );
  }
}

class _SearchPageResults extends ConsumerWidget {
  const _SearchPageResults({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(searchViewModelProvider.notifier);
    final loadingToSearchListPair = ref.watch(searchViewModelProvider
        .select((value) => Tuple2(value.showLoading, value.searchList)));

    final showLoading = loadingToSearchListPair.item1;
    final searchList = loadingToSearchListPair.item2;

    if (!showLoading && searchList.isEmpty) {
      return Expanded(
        child: Center(
          child: viewModel.searchTerm.isEmpty
              ? Text(LocaleKeys.searchResultsAppearHere.tr)
              : Text(LocaleKeys.noResultsFound.tr),
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
              intentHandler: viewModel.onIntent,
            );
          },
        ),
      );
    }
  }
}

@visibleForTesting
class SearchPageLoadingShimmer extends StatelessWidget {
  const SearchPageLoadingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
        highlightColor: Theme.of(context).primaryColor.withOpacity(0.2),
        period: const Duration(seconds: 1),
        direction: ShimmerDirection.ltr,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Card(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                ),
              ),
            );
          },
          itemCount: 3,
        ),
      ),
    );
  }
}
