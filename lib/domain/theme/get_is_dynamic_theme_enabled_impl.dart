import 'package:flutter_template/domain/theme/get_is_dynamic_theme_enabled.dart';
import 'package:flutter_template/foundation/unit.dart';
import 'package:flutter_template/repository/theme/theme_repository.dart';

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
