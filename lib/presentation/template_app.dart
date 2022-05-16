import 'package:device_preview/device_preview.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/flavors/flavor.dart';
import 'package:flutter_template/flavors/flavor_config.dart';
import 'package:flutter_template/navigation/base/app_router.dart';
import 'package:flutter_template/presentation/base/widgets/snackbar/snackbar.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class TemplateApp extends StatelessWidget {
  TemplateApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = GetIt.I.get();

  @override
  Widget build(BuildContext context) {
    const enableDevicePreview =
        String.fromEnvironment("enableDevicePreview") == "true";
    final _useDevicePreview = enableDevicePreview &&
        kDebugMode &&
        FlavorConfig.instance.flavor == Flavor.dev;

    return ProviderScope(
      child: DevicePreview(
        enabled: _useDevicePreview,
        builder: (context) => DynamicColorBuilder(builder: (context) {
          ThemeData lightMode = ThemeData(
            useMaterial3: true,
            fontFamily: GoogleFonts.signika().fontFamily,
            snackBarTheme: const SnackBarThemeData(),
            colorScheme: ColorScheme.fromSeed(
              seedColor: HexColor('#6c8cf5'),
              brightness: Brightness.light,
            ),
          );
          ThemeData darkMode = ThemeData(
            useMaterial3: true,
            fontFamily: GoogleFonts.signika().fontFamily,
            snackBarTheme: const SnackBarThemeData(),
            colorScheme: ColorScheme.fromSeed(
              seedColor: HexColor('#6c8cf5'),
              brightness: Brightness.dark,
            ),
          );

          return MaterialApp.router(
            useInheritedMediaQuery: _useDevicePreview,
            builder: DevicePreview.appBuilder,
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: ThemeMode.system,
            routerDelegate: _appRouter.delegate(
              initialRoutes: [HomeRoute(homeScreen: const HomeScreen())],
            ),
            routeInformationParser: _appRouter.defaultRouteParser(),
            // localizationsDelegates: context.localizationDelegates,
            // supportedLocales: context.supportedLocales,
            // locale: _useDevicePreview
            // ? DevicePreview.locale(context)
            // : context.locale,
            scaffoldMessengerKey: scaffoldMessengerKey,
          );
        }),
      ),
    );
  }
}
