import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/theme/TemplateAppThemeData.dart';

class TemplateApp extends StatelessWidget {
  const TemplateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // todo: Get from flavor
      theme: templateAppThemeData,
      home: const SizedBox(),
    );
  }
}
