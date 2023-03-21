import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/page/base_page.dart';

import 'widgets/{{name.snakeCase()}}_page_body/{{name.snakeCase()}}_page_body.dart';

@RoutePage()
class {{name.pascalCase()}}Page extends ConsumerWidget {
  final {{name.pascalCase()}}Screen {{name.camelCase()}}Screen;

  const {{name.pascalCase()}}Page({
    super.key,
    required this.{{name.camelCase()}}Screen,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage<{{name.pascalCase()}}Screen, {{name.pascalCase()}}ScreenState, {{name.pascalCase()}}ViewModel>(
      viewModelProvider: {{name.camelCase()}}ViewModelProvider,
      screen: {{name.camelCase()}}Screen,
      appBarActions: () => [],
      body: const {{name.pascalCase()}}PageBody(),
    );
  }
}
