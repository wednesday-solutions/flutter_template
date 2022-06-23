import 'package:drift/drift.dart';

class LocalLocation extends Table {
  TextColumn get country => text()();

  RealColumn get lat => real()();

  RealColumn get lon => real()();

  TextColumn get name => text()();

  TextColumn get state => text().nullable()();

  @override
  Set<Column> get primaryKey => {lat, lon};
}
