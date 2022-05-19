import 'package:flutter_template/domain/entity/theme/theme_mode.dart';
import 'package:flutter_template/domain/theme/set_theme_mode_use_case.dart';
import 'package:flutter_template/repository/theme/theme_repository.dart';

class SetThemeModeUseCaseImpl extends SetThemeModeUseCase {
  final ThemeRepository themeRepository;

  SetThemeModeUseCaseImpl({required this.themeRepository});

  @override
  Future<void> callInternal(AppThemeMode param) async {
    return await themeRepository.setThemeMode(themeMode: param);
  }
}
