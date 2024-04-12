import 'package:flutter_template/interactor/weather/favorite/favorite_weather_interactor.dart';
import 'package:flutter_template/navigation/weather/home/home_navigator.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_screen_state.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_view_model.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:flutter_template/presentation/entity/base/ui_toolbar.dart';
import 'package:flutter_template/presentation/intl/translations/translation_keys.dart';

class {{name.pascalCase()}}ViewModelImpl extends {{name.pascalCase()}}ViewModel {
  final {{name.pascalCase()}}Navigator {{name.camelCase()}}Navigator;

  {{name.pascalCase()}}ViewModelImpl({
    required this.{{name.camelCase()}}Navigator,
  }) : super(_initialState);

  static get _initialState => {{name.pascalCase()}}ScreenState(
        toolbar: UIToolbar(
          title: LocaleKeys.{{name.camelCase()}}PageTitle,
          hasBackButton: false,
        ),
        showLoading: false,
      );

  @override
  void onInit() {

  }

  @override
  void onIntent({{name.pascalCase()}}ScreenIntent intent) {
    switch (intent) {

    }
  }
}
