import 'package:flutter_template/interactor/weather/search/search_city_interactor.dart';
import 'package:flutter_template/navigation/search/search_navigator.dart';
import 'package:flutter_template/presentation/base/controller/base_controller.dart';
import 'package:flutter_template/presentation/base/intent/intent_handler.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/weather/search/search_screen_intent.dart';
import 'package:flutter_template/presentation/weather/search/search_screen_state.dart';

class SearchController extends BaseController<SearchScreen, SearchScreenState>
    implements IntentHandler<SearchScreenIntent> {
  final SearchNavigator searchNavigator;
  final SearchCityInteractor searchCityInteractor;

  SearchController({
    required this.searchNavigator,
    required this.searchCityInteractor,
  });

  @override
  SearchScreenState getDefaultState() => SearchScreenState(
        toolbar: UIToolbar(title: "Search Page", hasBackButton: true),
        showLoading: false,
        searchList: List.empty(),
      );

  @override
  void onIntent(SearchScreenIntent intent) {
    intent.when(
      back: () => searchNavigator.back(),
      search: (searchTerm) {},
    );
  }
}
