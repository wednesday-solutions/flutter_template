import 'dart:io';
import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/flavors/flavor_config.dart';
import 'package:flutter_template/services/base/database/app_database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

AppDatabase connect() {
  final db = LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'template_app_db.sqlite'));

    if (!await file.exists()) {
      final blob = await rootBundle.load('assets/pre_populated_cities.sqlite');
      final buffer = blob.buffer;
      await file.writeAsBytes(
          buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
    }

    return NativeDatabase(
      file,
      logStatements: FlavorConfig.values.logSqlStatements,
    );
  });

  return AppDatabase(db);
}
