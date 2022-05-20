import 'package:flutter_template/domain/base/usecase/base_async_use_case.dart';
import 'package:flutter_template/domain/entity/theme/theme_mode.dart';

abstract class SetThemeModeUseCase
    extends BaseAsyncUseCase<AppThemeMode, void> {}
