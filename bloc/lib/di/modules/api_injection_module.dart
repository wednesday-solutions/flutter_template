import 'package:flutter_template_bloc/data/datasource/network/weather_api_service.dart';
import 'package:flutter_template_bloc/data/datasource/network/weather_api_service_interface.dart';
import 'package:flutter_template_bloc/di/service_locator.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class ApiInjectionModule {
  @LazySingleton()
  Dio dioClient() {
    final dioClient = Dio();
    dioClient.interceptors.add(PrettyDioLogger(
      responseBody: false
    ));
    return dioClient;
  }

  @LazySingleton(as: IWeatherApiService)
  WeatherAPIService weatherApiService() {
    final dioClient = getIt<Dio>();
    final client = WeatherAPIService(dioClient);
    return client;
  }
}
