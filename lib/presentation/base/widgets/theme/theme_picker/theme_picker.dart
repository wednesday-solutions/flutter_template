import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/theme/theme_intent.dart';
import 'package:flutter_template/presentation/base/theme/theme_view_model.dart';
import 'package:flutter_template/presentation/base/widgets/theme/theme_picker/theme_picker_content.dart';

class ThemePicker extends ConsumerWidget {
  const ThemePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeViewModel = ref.watch(themeViewModelProvider.notifier);
    final themeState = ref.watch(themeViewModelProvider);

    return ThemePickerContent(
      themeMode: themeState.themeMode,
      onThemeModeSelected: (ThemeMode mode) {
        themeViewModel.onIntent(SetThemeModeThemeIntent(mode: mode));
      },
    );
  }
}
