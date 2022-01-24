import 'package:flutter_template/foundation/logger/logger.dart';
import 'package:flutter_template/interactor/weather/search/search_city_interactor.dart';
import 'package:flutter_template/navigation/search/search_navigator.dart';
import 'package:flutter_template/presentation/base/controller/base_controller.dart';
import 'package:flutter_template/presentation/base/intent/intent_handler.dart';
import 'package:flutter_template/presentation/base/widgets/snackbar/custom_snackbar.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/intl/strings.dart';
import 'package:flutter_template/presentation/weather/search/search_screen_intent.dart';
import 'package:flutter_template/presentation/weather/search/search_screen_state.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SearchController extends BaseController<SearchScreen, SearchScreenState>
    implements IntentHandler<SearchScreenIntent> {
  final SearchNavigator searchNavigator;
  final SearchCityInteractor searchCityInteractor;
  final _searchTerm = "".obs;

  SearchController({
    required this.searchNavigator,
    required this.searchCityInteractor,
  });

  @override
  void onInit() {
    super.onInit();

    searchCityInteractor.searchResultsStream.listen((event) {
      setState((state) => state.copyWith(searchList: event));
    });

    debounce<String>(_searchTerm, (searchString) async {
      log.e("Search string: $searchString");
      if (searchString.isNotEmpty && searchString.isBlank != true) {
        setState((state) => state.copyWith(showLoading: true));
        await searchCityInteractor.search(searchString);
        setState((state) => state.copyWith(showLoading: false));
      } else {
        setState((state) => state.copyWith(searchList: List.empty()));
      }
    },
    time: Duration(milliseconds: 400),);
  }

  @override
  SearchScreenState getDefaultState() => SearchScreenState(
        toolbar: UIToolbar(
          title: Strings.searchPageTitle.tr,
          hasBackButton: true,
        ),
        showLoading: false,
        searchList: List.empty(),
      );

  @override
  void onIntent(SearchScreenIntent intent) {
    intent.when(
      back: () => searchNavigator.back(),
      search: (searchTerm) {
        _searchTerm.value = searchTerm;
      },
      favorite: (int cityId, bool isFavorite) {
        showSnackbar(text: "City $cityId set as Favorite.");
      },
    );
  }
}
