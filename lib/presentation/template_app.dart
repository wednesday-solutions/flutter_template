import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/navigation/base/app_router.dart';
import 'package:flutter_template/presentation/base/theme/template_app_theme_data.dart';
import 'package:flutter_template/presentation/base/widgets/snackbar/custom_snackbar.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:get_it/get_it.dart';

class TemplateApp extends StatelessWidget {
  TemplateApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = GetIt.I.get();

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'Flutter Demo',
        // todo: Get from flavor
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        routerDelegate: _appRouter.delegate(initialRoutes: [
          HomeRoute(
            homeScreen: const HomeScreen(),
          )
        ]),
        routeInformationParser: _appRouter.defaultRouteParser(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        scaffoldMessengerKey: scaffoldMessengerKey,
      ),
    );
  }
}
