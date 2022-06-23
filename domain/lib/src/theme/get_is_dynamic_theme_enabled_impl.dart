import 'package:domain/interface/theme/get_is_dynamic_theme_enabled.dart';
import 'package:foundation/foundation.dart';
import 'package:repository/repository.dart';

class GetIsDynamicThemeEnabledImpl extends GetIsDynamicThemeEnabled {
  final ThemeRepository themeRepository;

  GetIsDynamicThemeEnabledImpl({
    required this.themeRepository,
  });

  @override
  bool callInternal(Unit param) {
    return themeRepository.getIsDynamicEnabled();
  }
}
