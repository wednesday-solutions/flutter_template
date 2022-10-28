import 'dart:io';
import 'package:drift/drift.dart';
import 'package:flutter_template/flavors/flavor_config.dart';
import 'package:flutter_template/services/base/database/app_database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

AppDatabase connect() {
  final db = LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'template_app_db.sqlite'));
    return NativeDatabase(
      file,
      logStatements: FlavorConfig.instance.values.logSqlStatements,
    );
  });

  return AppDatabase(db);
}