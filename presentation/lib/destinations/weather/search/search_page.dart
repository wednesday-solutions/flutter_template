import 'package:flutter/material.dart';
import 'package:presentation/base/exceptions/unhandled_effect_exception.dart';
import 'package:presentation/base/page/base_page.dart';
import 'package:presentation/base/widgets/snackbar/snackbar.dart';
import 'package:presentation/destinations/weather/search/search_screen_intent.dart';
import 'package:presentation/destinations/weather/search/search_screen_state.dart';
import 'package:presentation/destinations/weather/search/search_view_model.dart';
import 'package:presentation/destinations/weather/search/widgets/search_page_body/search_page_body.dart';
import 'package:presentation_entity/presentation_entity.dart';

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
      body: const SearchPageBody(),
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
