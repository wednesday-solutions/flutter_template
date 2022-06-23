import 'package:domain/interface/theme/set_is_dynamic_theme_enabled.dart';
import 'package:repository/repository.dart';

class SetIsDynamicThemeEnabledImpl extends SetIsDynamicThemeEnabled {
  final ThemeRepository themeRepository;

  SetIsDynamicThemeEnabledImpl({
    required this.themeRepository,
  });

  @override
  Future<void> callInternal(bool param) async {
    return themeRepository.setIsDynamicEnabled(isDynamic: param);
  }
}
