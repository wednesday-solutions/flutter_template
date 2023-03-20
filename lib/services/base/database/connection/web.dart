import 'package:drift/web.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/services/base/database/app_database.dart';

AppDatabase connect() {
  return AppDatabase(WebDatabase('db', initializer: () async {
    return (await rootBundle.load('assets/pre_populated_cities.sqlite'))
        .buffer
        .asUint8List();
  }));
  //typedef CreateWebDatabase = FutureOr<Uint8List> Function();
}
