import 'package:flutter_template/domain/entity/theme/theme_mode.dart';
import 'package:flutter_template/domain/theme/get_theme_mode_use_case.dart';
import 'package:flutter_template/foundation/unit.dart';
import 'package:flutter_template/repository/theme/theme_repository.dart';

class GetThemeModeUseCaseImpl extends GetThemeModeUseCase {
  final ThemeRepository themeRepository;

  GetThemeModeUseCaseImpl({required this.themeRepository});

  @override
  AppThemeMode callInternal(Unit param) => themeRepository.getThemeMode();
}
