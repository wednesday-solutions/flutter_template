import 'package:flutter_template/presentation/base/controller/base_controller.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/weather/search/search_screen_state.dart';

class SearchController extends BaseController<SearchScreen, SearchScreenState> {
  @override
  SearchScreenState getDefaultState() => SearchScreenState(
        toolbar: UIToolbar(title: "Search Page", hasBackButton: true),
        showLoading: false,
        searchList: List.empty(),
      );
}
