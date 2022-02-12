import 'package:drift/drift.dart';
import 'package:flutter_template/foundation/mapper/mapper2.dart';
import 'package:flutter_template/services/base/database/app_database.dart';
import 'package:flutter_template/services/entity/weather/remote/remote_weather.dart';

abstract class LocalDayWeatherMapper
    extends Mapper2<RemoteWeather, int, List<LocalDayWeatherCompanion>> {}

class LocalDayWeatherMapperImpl extends LocalDayWeatherMapper {
  @override
  List<LocalDayWeatherCompanion> map(RemoteWeather from1, int from2) {
    return from1.consolidatedWeather.map((weather) {
      return LocalDayWeatherCompanion(
        cityWoeid: Value(from2),
        temp: Value(weather.theTemp.toInt()),
        minTemp: Value(weather.minTemp.toInt()),
        maxTemp: Value(weather.maxTemp.toInt()),
        date: Value(weather.date),
      );
    }).toList();
  }
}
