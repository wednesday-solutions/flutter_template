import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/intent/intent_handler.dart';
import 'package:flutter_template/presentation/base/theme/theme_intent.dart';
import 'package:flutter_template/presentation/base/theme/theme_state.dart';
import 'package:get_it/get_it.dart';

final themeViewModelProvider =
    StateNotifierProvider<ThemeViewModel, ThemeState>((ref) => GetIt.I.get());

abstract class ThemeViewModel extends StateNotifier<ThemeState>
    implements IntentHandler<ThemeIntent> {
  ThemeViewModel(super.state);
}
