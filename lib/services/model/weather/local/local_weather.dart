import 'package:drift/drift.dart';
import 'package:flutter_template/services/base/database/helpers/foreign_key_helper.dart';

class LocalWeather extends Table {
  IntColumn get cityWoeid => integer().foreignKey(
        column: "local_city(woeid)",
        cascadeOnDelete: true,
      )();
  TextColumn get title => text()();

  @override
  Set<Column>? get primaryKey => {cityWoeid};
}
