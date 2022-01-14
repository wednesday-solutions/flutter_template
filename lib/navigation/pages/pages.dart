import 'package:flutter_template/presentation/entity/routes/routes.dart';
import 'package:flutter_template/presentation/weather/search/search_page.dart';
import 'package:get/route_manager.dart';

final pages = [
  GetPage(
    name: Routes.SEARCH,
    page: () => SearchPage(),
  ),
];

// final unknownRoute = GetPage(name: Routes.UNKNOWN, page: () => ,)) // todo
