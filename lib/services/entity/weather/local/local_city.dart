import 'package:drift/drift.dart';

class LocalCity extends Table {
  IntColumn get woeid => integer()();
  TextColumn get title => text()();
  TextColumn get locationType => text()();
  TextColumn get location => text()();

  @override
  Set<Column>? get primaryKey => {woeid};
}
