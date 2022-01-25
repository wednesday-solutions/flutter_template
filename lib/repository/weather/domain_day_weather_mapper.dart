import 'package:flutter_template/domain/entity/weather/day_weather.dart';
import 'package:flutter_template/foundation/mapper/mapper.dart';
import 'package:flutter_template/repository/date/date_repository.dart';
import 'package:flutter_template/services/base/database/app_database.dart';

abstract class DomainDayWeatherMapper
    extends Mapper<LocalDayWeatherData, DayWeather> {}

class DomainDayWeatherMapperImpl extends DomainDayWeatherMapper {
  final DateRepository dateRepository;

  DomainDayWeatherMapperImpl({required this.dateRepository});

  @override
  DayWeather map(LocalDayWeatherData from) {
    final date = dateRepository.mapDartDateTimeToDate(from.date);
    return DayWeather(
      minTemp: from.minTemp,
      maxTemp: from.maxTemp,
      temp: from.temp,
      date: date,
      isToday: date == dateRepository.todayDate(),
    );
  }
}
