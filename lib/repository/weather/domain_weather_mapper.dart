import 'package:flutter_template/domain/entity/weather/weather.dart';
import 'package:flutter_template/foundation/mapper/mapper.dart';
import 'package:flutter_template/repository/weather/domain_day_weather_mapper.dart';
import 'package:flutter_template/services/entity/weather/local/local_city_with_weather.dart';

abstract class DomainWeatherMapper
    extends Mapper<LocalCityWithWeather, Weather> {}

class DomainWeatherMapperImpl extends DomainWeatherMapper {
  final DomainDayWeatherMapper domainDayWeatherMapper;

  DomainWeatherMapperImpl({required this.domainDayWeatherMapper});

  @override
  Weather map(LocalCityWithWeather from) {
    return Weather(
      title: from.weather.title,
      woeid: from.city.woeid,
      dayWeatherList: domainDayWeatherMapper.mapList(from.dayWeather),
    );
  }
}
