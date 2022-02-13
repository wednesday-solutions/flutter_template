import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_template/domain/di/domain_module.dart';
import 'package:flutter_template/foundation/logger/logger.dart';
import 'package:flutter_template/interactor/di/interactor_module.dart';
import 'package:flutter_template/navigation/di/navigation_module.dart';
import 'package:flutter_template/presentation/di/presentation_module.dart';
import 'package:flutter_template/presentation/intl/translations/translation_loader.dart';
import 'package:flutter_template/presentation/template_app.dart';
import 'package:flutter_template/repository/di/repository_module.dart';
import 'package:flutter_template/services/di/service_module.dart';
import 'package:get_it/get_it.dart';

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

  await _initialiseGetIt();

  await EasyLocalization.ensureInitialized();
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

Future _initialiseGetIt() async {
  log.d("Initializing dependencies...");
  GetIt.instance
    ..serviceModule()
    ..repositoryModule()
    ..domainModule()
    ..interactorModule()
    ..presentationModule()
    ..navigationModule();
}
