import 'package:flutter_template/presentation/base/controller/base_controller.dart';
import 'package:flutter_template/presentation/entity/routes/routes.dart';
import 'package:flutter_template/presentation/weather/search/search_controller.dart';
import 'package:flutter_template/presentation/weather/search/search_page.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get_it/get_it.dart';

final pages = [
  GetPage(
    name: Routes.SEARCH,
    page: () => SearchPage(),
    binding: _PageBinding<SearchController>(),
  ),
];

class _PageBinding<CONTROLLER extends BaseController> extends Bindings {
  @override
  void dependencies() {
    final controller = GetIt.I.get<CONTROLLER>();
    Get.put(controller);
  }
}
