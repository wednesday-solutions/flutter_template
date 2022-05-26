import 'package:flutter_template/domain/entity/weather/weather.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';
import 'package:flutter_template/foundation/mapper/mapper.dart';
import 'package:flutter_template/services/base/database/app_database.dart';

abstract class DomainWeatherMapper
    extends Mapper<LocalCurrentWeatherData, Weather> {}

class DomainWeatherMapperImpl extends DomainWeatherMapper {
  @override
  Weather map(LocalCurrentWeatherData from) {
    logD("map: from = $from");
    return Weather(
      title: "${from.name}, ${from.sysCountry}",
      description: from.weatherDescription,
      lat: from.coordLat,
      lon: from.coordLon,
      minTemp: from.mainTempMin,
      maxTemp: from.mainTempMax,
      temp: from.mainTemp,
      feelsLike: from.mainFeelsLike,
      iconUrl: "https://openweathermap.org/img/wn/${from.weatherIcon}@4x.png",
    );
  }
}
