import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/widgets/list/ui_list.dart';
import 'package:flutter_template/presentation/base/widgets/observable/memoised_obx.dart';
import 'package:flutter_template/presentation/base/widgets/page/base_page.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';
import 'package:flutter_template/presentation/intl/strings.dart';
import 'package:flutter_template/presentation/weather/search/list/ui_city_renderer.dart';
import 'package:flutter_template/presentation/weather/search/search_controller.dart';
import 'package:flutter_template/presentation/weather/search/search_screen_intent.dart';
import 'package:flutter_template/presentation/weather/search/search_screen_state.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SearchPage extends StatelessWidget {
  const SearchPage();

  @override
  Widget build(BuildContext context) {
    return BasePage<SearchScreen, SearchScreenState, SearchController>(
      hideDefaultLoading: true,
      onAppBarBackPressed: (controller) => controller.onIntent(
        SearchScreenIntent.back(),
      ),
      body: (context, controller) {
        final textController = TextEditingController();
        textController.addListener(() {
          controller.onIntent(SearchScreenIntent.search(
            searchTerm: textController.text,
          ));
        });
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Flex(
            direction: Axis.vertical,
            children: [
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: Strings.startTypingToSearch.tr,
                ),
              ),
              MemoisedObx<bool>(
                selector: (_) => controller.state.showLoading,
                child: (showLoading) {
                  if (!showLoading && controller.state.searchList.isEmpty) {
                    return Expanded(
                      child: Center(
                        child: controller.searchTerm.isEmpty
                            ? Text(Strings.searchResultsAppearHere.tr)
                            : Text(Strings.noResultsFound.tr),
                      ),
                    );
                  }
                  if (showLoading) {
                    return const SearchPageLoadingShimmer();
                  } else {
                    return MemoisedObx<List<UIListItem>>(
                        selector: (_) => controller.state.searchList,
                        child: (list) {
                          // return SizedBox();
                          return Expanded(
                            child: UIList<SearchScreenIntent>(
                              renderers: {
                                UICity: UICityRenderer(),
                              },
                              items: list,
                              intentHandler: controller,
                            ),
                          );
                        });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class SearchPageLoadingShimmer extends StatelessWidget {
  const SearchPageLoadingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Get.theme.scaffoldBackgroundColor.withOpacity(0.1),
        highlightColor: Get.theme.primaryColor.withOpacity(0.2),
        period: const Duration(seconds: 1),
        direction: ShimmerDirection.ltr,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Card(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                ),
              ),
            );
          },
          itemCount: 3,
        ),
      ),
    );
  }
}
