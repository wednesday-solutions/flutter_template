import 'package:domain/interface/theme/get_theme_mode_use_case.dart';
import 'package:domain_entity/domain_entity.dart';
import 'package:foundation/foundation.dart';
import 'package:repository/interface/theme/theme_repository.dart';

class GetThemeModeUseCaseImpl extends GetThemeModeUseCase {
  final ThemeRepository themeRepository;

  GetThemeModeUseCaseImpl({required this.themeRepository});

  @override
  AppThemeMode callInternal(Unit param) => themeRepository.getThemeMode();
}
