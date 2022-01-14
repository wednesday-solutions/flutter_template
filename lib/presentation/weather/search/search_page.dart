import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/controller/controller_extendsions.dart';
import 'package:flutter_template/presentation/base/widgets/page/base_page.dart';
import 'package:flutter_template/presentation/entity/routes/routes.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/weather/search/search_controller.dart';
import 'package:flutter_template/presentation/weather/search/search_screen_state.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage();

  @override
  Widget build(BuildContext context) {
    return BasePage<SearchScreen, SearchScreenState, SearchController>(
      body: (context, controller) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text("${controller.count}")),
            Text("${context.controller<SearchController>().screen?.temp}"),
            MaterialButton(
              child: Text("Navigate"),
              onPressed: () => Get.toNamed(Routes.SEARCH,
                  preventDuplicates: false,
                  arguments: SearchScreen("From Nav $this")),
            ),
            MaterialButton(
                child: Text("Theme"),
                onPressed: () {
                  if (Get.isDarkMode) {
                    Get.changeTheme(ThemeData.light());
                  } else {
                    Get.changeTheme(ThemeData.dark());
                  }
                }),
            MaterialButton(
              child: Text("Count"),
              onPressed: () => controller.count.value++,
            ),
          ],
        );
      },
    );
  }
}
