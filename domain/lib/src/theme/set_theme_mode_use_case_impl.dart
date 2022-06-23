import 'package:domain/interface/theme/set_theme_mode_use_case.dart';
import 'package:domain_entity/domain_entity.dart';
import 'package:repository/repository.dart';

class SetThemeModeUseCaseImpl extends SetThemeModeUseCase {
  final ThemeRepository themeRepository;

  SetThemeModeUseCaseImpl({required this.themeRepository});

  @override
  Future<void> callInternal(AppThemeMode param) async {
    return await themeRepository.setThemeMode(themeMode: param);
  }
}
