import 'package:dio/dio.dart';
import 'package:flutter_template/flavors/flavor_config.dart';

Dio provideDio({List<Interceptor> interceptors = const []}) {
  final baseOption = BaseOptions(
    baseUrl: FlavorConfig.values.apiBaseUrl,
  );
  final dio = Dio(baseOption);

  final logInterceptor = LogInterceptor(
    requestBody: true,
    responseBody: true,
  );

  if (FlavorConfig.values.showLogs) {
    dio.interceptors.add(logInterceptor);
  }

  dio.interceptors.addAll(interceptors);

  return dio;
}
