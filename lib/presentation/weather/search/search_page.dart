import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/widgets/page/base_page.dart';
import 'package:flutter_template/presentation/entity/routes/routes.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/weather/search/search_controller.dart';
import 'package:flutter_template/presentation/weather/search/search_screen_intent.dart';
import 'package:flutter_template/presentation/weather/search/search_screen_state.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage();

  @override
  Widget build(BuildContext context) {
    return BasePage<SearchScreen, SearchScreenState, SearchController>(
      onAppBarBackPressed: (controller) => controller.onIntent(
        SearchScreenIntent.back(),
      ),
      body: (context, controller) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text("Navigate"),
              onPressed: () => Get.toNamed(Routes.SEARCH,
                  preventDuplicates: false,
                  arguments: SearchScreen("From Nav $this")),
            ),
          ],
        );
      },
    );
  }
}
