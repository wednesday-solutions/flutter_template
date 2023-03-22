import 'package:flutter/material.dart';


class {{name.pascalCase()}}PageBodyContent extends StatelessWidget {
  final IntentHandlerCallback<{{name.pascalCase()}}ScreenIntent> intentHandler;

  const {{name.pascalCase()}}PageBodyContent({
    super.key,
    required this.intentHandler,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
