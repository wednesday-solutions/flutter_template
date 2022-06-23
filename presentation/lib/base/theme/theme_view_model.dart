import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/base/intent/intent_handler.dart';
import 'package:presentation/base/theme/theme_intent.dart';
import 'package:presentation/base/theme/theme_state.dart';

final themeViewModelProvider =
    StateNotifierProvider<ThemeViewModel, ThemeState>((ref) => GetIt.I.get());

abstract class ThemeViewModel extends StateNotifier<ThemeState>
    implements IntentHandler<ThemeIntent> {
  ThemeViewModel(super.state);
}
