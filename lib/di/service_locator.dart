
import 'package:flutter_template/database/weather_database.dart';
import 'package:flutter_template/network/weather_api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

GetIt sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton<WeatherDatabase>(() => WeatherDatabase());
  sl.registerLazySingleton<WeatherAPIService>(() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    final client = WeatherAPIService(dio);
    return client;
  });
}
