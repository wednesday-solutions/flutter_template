import 'package:flutter/material.dart';
import 'package:flutter_template/domain/di/domain_module.dart';
import 'package:flutter_template/foundation/logger/logger.dart';
import 'package:flutter_template/interactor/di/interactor_module.dart';
import 'package:flutter_template/presentation/template_app.dart';
import 'package:flutter_template/repository/di/repository_module.dart';
import 'package:flutter_template/services/di/service_module.dart';
import 'package:get/utils.dart';
import 'package:get_it/get_it.dart';

void startApp() {
  LogHelper.initialiseLogger();

  _initialiseGetIt();

  runApp(TemplateApp());
}

void _initialiseGetIt() {
  log.d("Initializing dependencies...");
  Get.log.printInfo(info: "Initializing dependencies...");
  Get.log.printError(info: "Initializing dependencies...");
  GetIt.instance
    ..serviceModule()
    ..repositoryModule()
    ..domainModule()
    ..interactorModule();
}
