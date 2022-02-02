import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/domain/di/domain_module.dart';
import 'package:flutter_template/foundation/logger/logger.dart';
import 'package:flutter_template/interactor/di/interactor_module.dart';
import 'package:flutter_template/navigation/di/navigation_module.dart';
import 'package:flutter_template/presentation/di/presentation_module.dart';
import 'package:flutter_template/presentation/template_app.dart';
import 'package:flutter_template/repository/di/repository_module.dart';
import 'package:flutter_template/services/di/service_module.dart';
import 'package:get_it/get_it.dart';

void startApp() async {
  LogHelper.initialiseLogger();

  _initialiseGetIt();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: const [Locale("en", "US")],
    path: "assets/translations",
    fallbackLocale: const Locale("en", "US"),
    child: TemplateApp(),
  ));
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
