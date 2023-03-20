import 'package:flutter_template/services/base/database/app_database.dart';

AppDatabase connect() {
  throw UnsupportedError(
      'No suitable database implementation was found on this platform.');
}
