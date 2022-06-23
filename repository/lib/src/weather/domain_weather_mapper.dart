import 'package:domain_entity/domain_entity.dart';
import 'package:foundation/foundation.dart';
import 'package:service/service.dart';

abstract class DomainWeatherMapper extends Mapper<LocalCurrentWeatherData, Weather> {}

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
