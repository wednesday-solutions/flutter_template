import 'package:flutter_template/presentation/base/controller/base_controller.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/weather/search/search_screen_state.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SearchController extends BaseController<SearchScreen, SearchScreenState> {
  final count = 1.obs;

  @override
  SearchScreenState getDefaultState() => SearchScreenState(
        toolbar: UIToolbar(title: "Search Page", hasBackButton: true),
        showLoading: false,
        searchList: List.empty(),
      );
}
