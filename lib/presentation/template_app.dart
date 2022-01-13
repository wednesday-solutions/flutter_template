import 'package:flutter/material.dart';
import 'package:flutter_template/navigation/pages/pages.dart';
import 'package:flutter_template/presentation/base/theme/TemplateAppThemeData.dart';
import 'package:flutter_template/presentation/entity/routes/routes.dart';
import 'package:get/get.dart';

class TemplateApp extends StatelessWidget {
  const TemplateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo', // todo: Get from flavor
      theme: templateAppThemeData,
      getPages: pages,
      initialRoute: Routes.SEARCH,
    );
  }
}
