import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/theme/theme_view_model.dart';

class ThemeListener extends ConsumerWidget {
  final Widget Function(ThemeMode themeMode) builder;

  const ThemeListener({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeViewModelProvider);
    return builder(themeMode);
  }
}
