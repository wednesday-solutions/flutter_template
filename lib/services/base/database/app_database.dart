import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_template/flavors/flavor_config.dart';
import 'package:flutter_template/services/base/database/migrations.dart';
import 'package:flutter_template/services/entity/open_weather/current_weather/local/local_current_weather.dart';
import 'package:flutter_template/services/entity/open_weather/geo_coding/local/local_location.dart';
import 'package:flutter_template/services/weather/local/weather_local_service_impl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

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
