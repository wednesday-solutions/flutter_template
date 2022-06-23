import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:foundation/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:service_entity/service_entity.dart';
import 'package:service/src/base/database/migrations.dart';
import 'package:service/src/weather/local/weather_local_service_impl.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [LocalLocation, LocalCurrentWeather],
  daos: [WeatherLocalServiceImpl],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => migrations();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'template_app_db.sqlite'));
    return NativeDatabase(
      file,
      logStatements: FlavorConfig.instance.values.logSqlStatements,
    );
  });
}
