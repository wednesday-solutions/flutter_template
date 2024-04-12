import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/theme/theme_intent.dart';
import 'package:flutter_template/presentation/base/theme/theme_view_model.dart';
import 'package:flutter_template/presentation/base/widgets/theme/dynamic_theme_switch/dynamic_theme_switch_content.dart';

class DynamicThemeSwitch extends ConsumerWidget {
  const DynamicThemeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeViewModel = ref.watch(themeViewModelProvider.notifier);
    final isDynamic =
        ref.watch(themeViewModelProvider.select((value) => value.isDynamic));
    return DynamicThemeSwitchContent(
      isDynamic: isDynamic,
      onIsDynamicToggled: (isDynamic) {
        themeViewModel.onIntent(SetIsDynamicThemeIntent(isDynamic: isDynamic));
      },
    );
  }
}
