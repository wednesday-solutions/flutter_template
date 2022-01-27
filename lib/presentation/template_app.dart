import 'package:flutter/material.dart';
import 'package:flutter_template/foundation/logger/logger.dart';
import 'package:flutter_template/navigation/pages/pages.dart';
import 'package:flutter_template/presentation/base/theme/template_app_theme_data.dart';
import 'package:flutter_template/presentation/entity/routes/routes.dart';
import 'package:flutter_template/presentation/intl/translations.dart';
import 'package:get/get.dart';

class TemplateApp extends StatelessWidget {
  const TemplateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo', // todo: Get from flavor
      getPages: pages,
      initialRoute: Routes.HOME,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      translations: AppTranslations(),
      locale: const Locale("en_US"),
      logWriterCallback: LogHelper.logWriterCallback,
      // unknownRoute: , // todo
    );
  }
}
