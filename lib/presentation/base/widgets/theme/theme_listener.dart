import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/theme/theme_state.dart';
import 'package:flutter_template/presentation/base/theme/theme_view_model.dart';

class ThemeStateListener extends ConsumerWidget {
  final Widget Function(ThemeState themeState) builder;

  const ThemeStateListener({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeViewModelProvider);
    return builder(themeState);
  }
}
