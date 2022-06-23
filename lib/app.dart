import 'dart:io';

import 'package:domain/domain.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:foundation/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:interactor/interactor.dart';
import 'package:presentation/di/presentation_module.dart';
import 'package:presentation/intl/translations/translation_loader.dart';
import 'package:presentation/navigation/di/navigation_module.dart';
import 'package:presentation/template_app.dart';
import 'package:repository/repository.dart';
import 'package:service/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void startApp() async {
  await _initialiseApp();

  runApp(EasyLocalization(
    supportedLocales: const [Locale("en", "US")],
    path: "assets/translations",
    fallbackLocale: const Locale("en", "US"),
    assetLoader: const CodegenLoader(),
    child: TemplateApp(),
  ));
}

Future _initialiseApp() async {
  final bindings = WidgetsFlutterBinding.ensureInitialized();

  bindings.deferFirstFrame();

  _initialiseGetIt();

  await Future.wait([
    _initSharedPreferences(),
    EasyLocalization.ensureInitialized(),
  ]);

  EasyLocalization.logger.printer = customEasyLogger;

  if (Platform.isAndroid) {
    try {
      FlutterDisplayMode.setHighRefreshRate();
    } on PlatformException catch (exception) {
      log.e(exception);
    }
  }

  bindings.allowFirstFrame();
}

Future _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  GetIt.instance.registerSingleton(sharedPreferences);
}

void _initialiseGetIt() {
  log.d("Initializing dependencies...");
  GetIt.instance
    ..serviceModule()
    ..repositoryModule()
    ..domainModule()
    ..interactorModule()
    ..presentationModule()
    ..navigationModule();
}
