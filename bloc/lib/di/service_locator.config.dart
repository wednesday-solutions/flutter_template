// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'modules/api_injection_module.dart';
import '../presentation/pages/cities/bloc/cities_bloc.dart';
import '../data/datasource/local/dao/city_dao.dart';
import 'modules/database_injection_module.dart';
import '../data/datasource/local/dao/city_dao_interface.dart';
import '../data/datasource/network/weather_api_service_interface.dart';
import '../data/repository/weather_repository_interface.dart';
import '../data/datasource/network/weather_api_service.dart';
import '../presentation/pages/weather/bloc/weather_bloc.dart';
import '../data/datasource/local/weather_database.dart';
import '../data/repository/weather_repository.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final apiInjectionModule = _$ApiInjectionModule();
  final databaseInjectionModule = _$DatabaseInjectionModule();
  gh.lazySingleton<Dio>(() => apiInjectionModule.dioClient());
  gh.lazySingleton<IWeatherApiService>(
      () => apiInjectionModule.weatherApiService());
  gh.lazySingleton<WeatherDatabase>(
      () => databaseInjectionModule.weatherDatabase());
  gh.lazySingleton<ICityDao>(() => CityDao(get<WeatherDatabase>()));
  gh.lazySingleton<IWeatherRepository>(
      () => WeatherRepository(get<ICityDao>(), get<IWeatherApiService>()));
  gh.lazySingleton<WeatherBloc>(() => WeatherBloc(get<IWeatherRepository>()));
  gh.factory<CitiesBloc>(() => CitiesBloc(get<IWeatherRepository>()));
  return get;
}

class _$ApiInjectionModule extends ApiInjectionModule {}

class _$DatabaseInjectionModule extends DatabaseInjectionModule {}
