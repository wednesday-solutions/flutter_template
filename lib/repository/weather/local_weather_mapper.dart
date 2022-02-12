import 'package:drift/drift.dart';
import 'package:flutter_template/foundation/mapper/mapper2.dart';
import 'package:flutter_template/services/base/database/app_database.dart';
import 'package:flutter_template/services/entity/weather/remote/remote_weather.dart';

abstract class LocalWeatherMapper
    extends Mapper2<RemoteWeather, int, LocalWeatherCompanion> {}

class LocalWeatherMapperImpl extends LocalWeatherMapper {
  @override
  LocalWeatherCompanion map(RemoteWeather from1, int from2) {
    return LocalWeatherCompanion(
      cityWoeid: Value(from2),
      title: Value(from1.title),
    );
  }
}
