
import 'package:drift/web.dart';
import 'package:flutter_template/services/base/database/app_database.dart';

AppDatabase connect() {
  return AppDatabase(WebDatabase('db'));
}