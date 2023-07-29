// ignore_for_file: unnecessary_import

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_page.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_screen.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_page.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: HomeScreen.path, page: HomeRoute.page, initial: true),
        AutoRoute(
          path: SearchScreen.path,
          page: SearchRoute.page,
        ),
      ];
}
