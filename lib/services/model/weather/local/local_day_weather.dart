import 'package:drift/drift.dart';
import 'package:flutter_template/services/base/database/helpers/foreign_key_helper.dart';

class LocalDayWeather extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cityWoeid => integer().foreignKey(
        column: "local_city(woeid)",
        cascadeOnDelete: true,
      )();
  IntColumn get temp => integer()();
  IntColumn get minTemp => integer()();
  IntColumn get maxTemp => integer()();
  DateTimeColumn get date => dateTime()();
}
