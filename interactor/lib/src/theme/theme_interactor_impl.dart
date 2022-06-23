import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:foundation/foundation.dart';
import 'package:interactor/interface/theme/theme_interactor.dart';
import 'package:interactor/src/theme/theme_mode_mapper.dart';

class ThemeInteractorImpl implements ThemeInteractor {
  final SetThemeModeUseCase setThemeModeUseCase;
  final GetThemeModeUseCase getThemeModeUseCase;
  final SetIsDynamicThemeEnabled setIsDynamicThemeEnabled;
  final GetIsDynamicThemeEnabled getIsDynamicThemeEnabled;
  final ThemeModeMapper themeModeMapper;

  ThemeInteractorImpl({
    required this.setThemeModeUseCase,
    required this.getThemeModeUseCase,
    required this.setIsDynamicThemeEnabled,
    required this.getIsDynamicThemeEnabled,
    required this.themeModeMapper,
  });

  @override
  ThemeMode getThemeMode() {
    final appThemeMode = getThemeModeUseCase(unit);
    return appThemeMode.when(
      success: (mode) => themeModeMapper.map(mode),
      error: (error) {
        log.e(error);
        return ThemeMode.system;
      },
    );
  }

  @override
  Future setThemeMode(ThemeMode themeMode) async {
    return setThemeModeUseCase(
      param: themeModeMapper.mapThemeMode(themeMode),
    );
  }

  @override
  bool getIsDynamicEnabled() {
    final isDynamicResult = getIsDynamicThemeEnabled(unit);
    return isDynamicResult.when(success: (isDynamic) {
      return isDynamic;
    }, error: (error) {
      return true;
    });
  }

  @override
  Future setIsDynamicEnabled(bool isDynamicEnabled) {
    return setIsDynamicThemeEnabled(param: isDynamicEnabled);
  }
}
