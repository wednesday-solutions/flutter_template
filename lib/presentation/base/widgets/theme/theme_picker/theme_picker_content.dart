import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/widgets/theme/dynamic_theme_switch/dynamic_theme_switch.dart';

class ThemePickerContent extends StatelessWidget {
  final Function(ThemeMode mode) onThemeModeSelected;
  final ThemeMode themeMode;

  const ThemePickerContent({
    super.key,
    required this.onThemeModeSelected,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ThemeMode>(
      onSelected: onThemeModeSelected,
      icon: const Icon(Icons.brightness_6),
      initialValue: themeMode,
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            child: DynamicThemeSwitch(),
          ),
          ...ThemeMode.values.map(
            (mode) {
              return CheckedPopupMenuItem<ThemeMode>(
                value: mode,
                checked: mode == themeMode,
                child: Text(mode.name),
              );
            },
          ),
        ];
      },
    );
  }
}
