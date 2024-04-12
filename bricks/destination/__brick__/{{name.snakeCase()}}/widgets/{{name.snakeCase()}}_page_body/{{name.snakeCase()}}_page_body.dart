import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class {{name.pascalCase()}}PageBody extends ConsumerWidget {
  const {{name.pascalCase()}}PageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final {{name.camelCase()}}ViewModel = ref.watch({{name.camelCase()}}ViewModelProvider.notifier);

    return {{name.pascalCase()}}PageBodyContent(intentHandler: {{name.camelCase()}}ViewModel.onIntent);
  }
}