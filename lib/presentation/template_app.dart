import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/theme/TemplateAppThemeData.dart';
import 'package:get/get.dart';

class TemplateApp extends StatelessWidget {
  const TemplateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo', // todo: Get from flavor
      theme: templateAppThemeData,
      getPages: [GetPage(name: "/page1", page: () => Page1())],
      initialRoute: "/page1",
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Page 1"),
        ),
        body: Container(
          child: Center(
            child: Text("Page 1"),
          ),
        ),
      ),
    );
  }
}
