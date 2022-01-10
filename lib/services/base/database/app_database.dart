// These imports are only needed to open the database
import 'package:drift/native.dart';
import 'package:flutter_template/services/model/weather/local_city.dart';
import 'package:flutter_template/services/model/weather/local_day_weather.dart';
import 'package:flutter_template/services/model/weather/local_weather.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'dart:io';

part 'app_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [LocalCity, LocalDayWeather, LocalWeather])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
