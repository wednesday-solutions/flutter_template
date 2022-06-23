import 'package:drift/drift.dart';
import 'package:service/src/base/database/app_database.dart';

extension MigrationsExt on AppDatabase {
  MigrationStrategy migrations() => MigrationStrategy(
        onUpgrade: (Migrator m, from, to) async {},
      );
}
