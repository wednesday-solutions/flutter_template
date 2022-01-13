import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/theme/TemplateAppThemeData.dart';
import 'package:flutter_template/presentation/entity/routes/routes.dart';
import 'package:flutter_template/presentation/weather/search/search_controller.dart';
import 'package:flutter_template/presentation/weather/search/search_page.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class TemplateApp extends StatelessWidget {
  const TemplateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo', // todo: Get from flavor
      theme: templateAppThemeData,
      getPages: [
        GetPage(
          name: Routes.SEARCH,
          page: () => SearchPage(),
          binding: BindingsBuilder(() {
            final controller = GetIt.I.get<SearchController>();
            Get.put(controller);
          }),
        )
      ],
      initialRoute: Routes.SEARCH,
    );
  }
}
