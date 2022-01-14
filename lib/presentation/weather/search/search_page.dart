import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/widgets/list/ui_list.dart';
import 'package:flutter_template/presentation/base/widgets/observable/memoised_obx.dart';
import 'package:flutter_template/presentation/base/widgets/page/base_page.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:flutter_template/presentation/entity/routes/routes.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';
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
      onAppBarBackPressed: (controller) =>
          controller.onIntent(
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
          child: Column(
            children: [
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Start typing to search",
                ),
              ),
              MemoisedObx<bool>(
                selector: (_) => controller.state.showLoading,
                child: (showLoading) {
                  if (showLoading)
                    return Shimmer.fromColors(
                        child: Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 25, width: double.infinity,);
                            },
                            itemBuilder: (context, index) {
                            return Container(
                              height: 25,
                              width: double.infinity,
                              color: Colors.white,
                            );
                          }, itemCount: 5,),
                        ),
                        baseColor: Colors.grey.shade100,
                        highlightColor: Colors.grey.shade400);
                  else
                    return MemoisedObx<List<UIListItem>>(
                        selector: (_) => controller.state.searchList,
                        child: (list) {
                          // return SizedBox();
                          return UIList(
                            renderers: {
                              UICity: UICityRenderer(),
                            },
                            items: list,
                          );
                        });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
