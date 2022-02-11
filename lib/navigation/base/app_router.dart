// ignore_for_file: unnecessary_import

import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/navigation/base/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_page.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: autoRoutes,
  preferRelativeImports: false,
  replaceInRouteName: "Page,Route",
)
class AppRouter extends _$AppRouter {}
