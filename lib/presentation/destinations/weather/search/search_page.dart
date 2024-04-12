import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/exceptions/unhandled_effect_exception.dart';
import 'package:flutter_template/presentation/base/page/base_page.dart';
import 'package:flutter_template/presentation/base/widgets/snackbar/snackbar.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen_state.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_view_model.dart';
import 'package:flutter_template/presentation/destinations/weather/search/widgets/search_page_body/search_page_body.dart';
import 'package:flutter_template/presentation/entity/effect/effect.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  final SearchScreen searchScreen;

  const SearchPage({super.key, required this.searchScreen});

  @override
  Widget build(BuildContext context) {
    return BasePage<SearchScreen, SearchScreenState, SearchViewModel>(
      hideDefaultLoading: true,
      viewModelProvider: searchViewModelProvider,
      screen: searchScreen,
      onAppBarBackPressed: (viewModel) => viewModel.onIntent(
        const BackSearchScreenIntent(),
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
