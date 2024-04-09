import 'package:drift/drift.dart';
import 'package:flutter_template/services/base/database/migrations.dart';
import 'package:flutter_template/services/entity/open_weather/current_weather/local/local_current_weather.dart';
import 'package:flutter_template/services/entity/open_weather/geo_coding/local/local_location.dart';
import 'package:flutter_template/services/weather/local/weather_local_service_impl.dart';
export 'connection/connection.dart';

part 'app_database.g.dart';

@DriftDatabase(
    tables: [LocalLocation, LocalCurrentWeather],
    daos: [WeatherLocalServiceImpl])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => migrations();
}
