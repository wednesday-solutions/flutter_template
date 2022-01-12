import 'package:flutter/material.dart';
import 'package:flutter_template/domain/di/domain_module.dart';
import 'package:flutter_template/interactor/di/interactor_module.dart';
import 'package:flutter_template/presentation/template_app.dart';
import 'package:flutter_template/repository/di/repository_module.dart';
import 'package:flutter_template/services/di/service_module.dart';
import 'package:get_it/get_it.dart';

void startApp() {
  _initialiseGetIt();
  runApp(TemplateApp());
}

void _initialiseGetIt() {
  GetIt.instance
    ..serviceModule()
    ..repositoryModule()
    ..domainModule()
    ..interactorModule();
}
