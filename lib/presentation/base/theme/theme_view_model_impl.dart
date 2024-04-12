import 'package:flutter/material.dart';
import 'package:flutter_template/interactor/theme/theme_interactor.dart';
import 'package:flutter_template/presentation/base/theme/theme_intent.dart';
import 'package:flutter_template/presentation/base/theme/theme_state.dart';
import 'package:flutter_template/presentation/base/theme/theme_view_model.dart';

class ThemeViewModelImpl extends ThemeViewModel {
  final ThemeInteractor themeInteractor;

  ThemeViewModelImpl({required this.themeInteractor})
      : super(
          const ThemeState(
            themeMode: ThemeMode.system,
            isDynamic: true,
          ),
        ) {
    state = ThemeState(
      themeMode: themeInteractor.getThemeMode(),
      isDynamic: themeInteractor.getIsDynamicEnabled(),
    );
  }

  @override
  Future<void> onIntent(ThemeIntent intent) async {
    switch (intent) {
      case SetThemeModeThemeIntent():
        await themeInteractor.setThemeMode(intent.mode);
        state = state.copyWith(themeMode: themeInteractor.getThemeMode());
      case SetIsDynamicThemeIntent():
        await themeInteractor.setIsDynamicEnabled(intent.isDynamic);
        state =
            state.copyWith(isDynamic: themeInteractor.getIsDynamicEnabled());
    }
  }
}
