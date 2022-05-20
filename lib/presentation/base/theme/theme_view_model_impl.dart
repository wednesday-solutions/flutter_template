import 'package:flutter/material.dart';
import 'package:flutter_template/interactor/theme/theme_interactor.dart';
import 'package:flutter_template/presentation/base/theme/theme_intent.dart';
import 'package:flutter_template/presentation/base/theme/theme_view_model.dart';

class ThemeViewModelImpl extends ThemeViewModel {
  final ThemeInteractor themeInteractor;

  ThemeViewModelImpl({required this.themeInteractor})
      : super(ThemeMode.system) {
    state = themeInteractor.getThemeMode();
  }

  @override
  void onIntent(ThemeIntent intent) {
    intent.when(
      setThemeMode: (mode) async {
        await themeInteractor.setThemeMode(mode);
        state = themeInteractor.getThemeMode();
      },
    );
  }
}
