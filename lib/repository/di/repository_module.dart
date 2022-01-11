import 'package:flutter_template/repository/date/date_mapper.dart';
import 'package:flutter_template/repository/date/date_repository.dart';
import 'package:flutter_template/repository/date/date_repository_impl.dart';
import 'package:flutter_template/repository/date/date_time_mapper.dart';
import 'package:flutter_template/repository/date/time_mapper.dart';
import 'package:flutter_template/repository/weather/domain_city_mapper.dart';
import 'package:flutter_template/repository/weather/domain_day_weather_mapper.dart';
import 'package:flutter_template/repository/weather/domain_weather_mapper.dart';
import 'package:flutter_template/repository/weather/local_city_mapper.dart';
import 'package:flutter_template/repository/weather/local_day_weather_mapper.dart';
import 'package:flutter_template/repository/weather/local_weather_mapper.dart';
import 'package:flutter_template/repository/weather/weather_repository.dart';
import 'package:flutter_template/repository/weather/weather_repository_impl.dart';
import 'package:get_it/get_it.dart';

extension RepositoryModule on GetIt {
  void repositoryModule() {
    // date
    registerLazySingleton<DateMapper>(() => DateMapperImpl());
    registerLazySingleton<DateTimeMapper>(() => DateTimeMapperImpl());
    registerLazySingleton<TimeMapper>(() => TimeMapperImpl());

    registerLazySingleton<DateRepository>(() => DateRepositoryImpl(
          dateMapper: get(),
          timeMapper: get(),
          dateTimeMapper: get(),
        ));

    // weather
    registerFactory<DomainCityMapper>(() => DomainCityMapperImpl());
    registerFactory<DomainDayWeatherMapper>(() => DomainDayWeatherMapperImpl(
          dateRepository: get(),
        ));
    registerFactory<DomainWeatherMapper>(() => DomainWeatherMapperImpl(
          domainDayWeatherMapper: get(),
        ));
    registerFactory<LocalCityMapper>(() => LocalCityMapperImpl());
    registerFactory<LocalDayWeatherMapper>(() => LocalDayWeatherMapperImpl());
    registerFactory<LocalWeatherMapper>(() => LocalWeatherMapperImpl());

    registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(
          weatherLocalService: get(),
          weatherRemoteService: get(),
          domainCityMapper: get(),
          domainWeatherMapper: get(),
          localCityMapper: get(),
          localWeatherMapper: get(),
          localDayWeatherMapper: get(),
          dateRepository: get(),
        ));
  }
}
