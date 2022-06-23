import 'package:get_it/get_it.dart';
import 'package:repository/interface/date/date_repository.dart';
import 'package:repository/interface/preferences/preferences_repository.dart';
import 'package:repository/interface/theme/theme_repository.dart';
import 'package:repository/interface/weather/weather_repository.dart';
import 'package:repository/src/date/date_mapper.dart';
import 'package:repository/src/date/date_repository_impl.dart';
import 'package:repository/src/date/date_time_mapper.dart';
import 'package:repository/src/date/time_mapper.dart';
import 'package:repository/src/preferences/preferences_repository_impl.dart';
import 'package:repository/src/theme/theme_repository_impl.dart';
import 'package:repository/src/weather/domain_city_mapper.dart';
import 'package:repository/src/weather/domain_weather_mapper.dart';
import 'package:repository/src/weather/local_city_mapper.dart';
import 'package:repository/src/weather/local_weather_mapper.dart';
import 'package:repository/src/weather/weather_repository_impl.dart';

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

    registerFactory<DomainWeatherMapper>(() => DomainWeatherMapperImpl());

    registerFactory<LocalCityMapper>(() => LocalCityMapperImpl());

    registerFactory<LocalWeatherMapper>(
        () => LocalWeatherMapperImpl(dateRepository: get()));

    registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(
          weatherLocalService: get(),
          weatherRemoteService: get(),
          domainCityMapper: get(),
          domainWeatherMapper: get(),
          localCityMapper: get(),
          localWeatherMapper: get(),
          dateRepository: get(),
        ));

    // preferences
    registerLazySingleton<PreferencesRepository>(
        () => PreferencesRepositoryImpl(
              preferencesService: get(),
            ));

    // theme
    registerLazySingleton<ThemeRepository>(() => ThemeRepositoryImpl(
          preferencesRepo: get(),
        ));
  }
}
