import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/entity/screen/screen_state.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';

class SearchScreenState extends ScreenState {
  final UIToolbar toolbar;
  final bool showLoading;
  final List<UICity> searchList;

  SearchScreenState({
    required this.toolbar,
    required this.showLoading,
    required this.searchList,
  }) : super(toolbar: toolbar, showLoading: showLoading);
}
