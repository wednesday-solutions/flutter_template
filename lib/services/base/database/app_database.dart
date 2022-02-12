import 'package:drift/native.dart';
import 'package:flutter_template/flavors/flavor_config.dart';
import 'package:flutter_template/services/base/database/migrations.dart';
import 'package:flutter_template/services/entity/weather/local/local_city.dart';
import 'package:flutter_template/services/entity/weather/local/local_day_weather.dart';
import 'package:flutter_template/services/entity/weather/local/local_weather.dart';
import 'package:flutter_template/services/weather/local/weather_local_service_impl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'dart:io';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [LocalCity, LocalDayWeather, LocalWeather],
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
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(
      file,
      logStatements: FlavorConfig.instance.values.logSqlStatements,
    );
  });
}
