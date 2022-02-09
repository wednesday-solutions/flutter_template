import 'package:dio/dio.dart';
import 'package:flutter_template/flavors/flavor_config.dart';

Dio provideDio() {
  final baseOption = BaseOptions(
    baseUrl: FlavorConfig.instance.values.apiBaseUrl,
  );
  final dio = Dio(baseOption);

  final logInterceptor = LogInterceptor(
    requestBody: true,
    responseBody: true,
  );

  if (FlavorConfig.instance.values.showLogs) {
    dio.interceptors.add(logInterceptor);
  }

  return dio;
}
