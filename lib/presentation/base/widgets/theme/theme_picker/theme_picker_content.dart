import 'package:flutter/material.dart';

class ThemePickerContent extends StatelessWidget {
  final Function(ThemeMode mode) onThemeModeSelected;
  final ThemeMode themeMode;

  const ThemePickerContent({
    Key? key,
    required this.onThemeModeSelected,
    required this.themeMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ThemeMode>(
      onSelected: onThemeModeSelected,
      icon: const Icon(Icons.brightness_6),
      initialValue: themeMode,
      itemBuilder: (context) {
        return ThemeMode.values.map((mode) {
          return CheckedPopupMenuItem<ThemeMode>(
            value: mode,
            checked: mode == themeMode,
            child: Text(mode.name),
          );
        }).toList();
      },
    );
  }
}
