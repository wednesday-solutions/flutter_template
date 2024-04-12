import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';
import 'package:flutter_template/foundation/mapper/mapper3.dart';
import 'package:flutter_template/repository/date/date_repository.dart';
import 'package:flutter_template/services/base/database/app_database.dart';
import 'package:flutter_template/services/entity/open_weather/current_weather/remote/remote_current_weather.dart';
import 'package:flutter_template/services/entity/open_weather/current_weather/remote/remote_current_weather_weather.dart';

abstract interface class LocalWeatherMapper
    implements
        Mapper3<RemoteCurrentWeather, double, double,
            LocalCurrentWeatherCompanion> {}

class LocalWeatherMapperImpl extends LocalWeatherMapper {
  final DateRepository dateRepository;

  LocalWeatherMapperImpl({required this.dateRepository});

  @override
  LocalCurrentWeatherCompanion map(
    RemoteCurrentWeather from1,
    double from2,
    double from3,
  ) {
    logD("map: from1 = $from1, from2 = $from2, from3 = $from3");
    final weather = from1.weather.firstOrNull ??
        RemoteCurrentWeatherWeather(
          id: 0,
          main: '',
          description: '',
          icon: '01d',
        );

    return LocalCurrentWeatherCompanion(
      base: Value(from1.base),
      cloudsAll: Value(from1.clouds.all),
      cod: Value(from1.cod),
      coordLat: Value(from2),
      coordLon: Value(from3),
      dt: Value(from1.dt),
      id: Value(from1.id),
      mainFeelsLike: Value(from1.main.feelsLike),
      mainTemp: Value(from1.main.temp),
      mainTempMin: Value(from1.main.tempMin),
      mainTempMax: Value(from1.main.tempMax),
      mainHumidity: Value(from1.main.humidity),
      mainPressure: Value(from1.main.pressure),
      name: Value(from1.name),
      sysCountry: Value(from1.sys.country),
      sysSunrise: Value(from1.sys.sunrise),
      sysSunset: Value(from1.sys.sunset),
      timezone: Value(from1.timezone),
      visibility: Value(from1.visibility),
      weatherId: Value(weather.id),
      weatherDescription: Value(weather.description),
      weatherIcon: Value(weather.icon),
      weatherMain: Value(weather.main),
      windDeg: Value(from1.wind.deg),
      windSpeed: Value(from1.wind.speed),
      updatedAt: Value(dateRepository.nowDartDateTime()),
    );
  }
}
