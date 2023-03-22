import 'package:drift/drift.dart';

extension ForeignKeyHelper<T extends Object> on ColumnBuilder<T> {
  ColumnBuilder<T> foreignKey({
    required String column,
    required bool cascadeOnDelete,
  }) {
    return customConstraint(
      "REFERENCES $column${cascadeOnDelete ? " ON DELETE CASCADE" : ""}",
    );
  }
}
