import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/flavors/flavor_config.dart';
import 'package:flutter_template/presentation/intl/translations/translation_loader.dart';
import 'package:flutter_template/presentation/template_app.dart';
import 'package:patrol/patrol.dart';

Future setupApp(PatrolIntegrationTester patrol) async {
  await dotenv.load(
    fileName: ".env.qa",
  );

  FlavorConfig.initialize(flavorString: "qa");

  await initialiseApp();

  await patrol.pumpWidgetAndSettle(
    EasyLocalization(
      supportedLocales: const [Locale("en", "US"), Locale("hi", "IN")],
      path: "assets/translations",
      fallbackLocale: const Locale("en", "US"),
      assetLoader: const CodegenLoader(),
      child: TemplateApp(),
    ),
  );
}
