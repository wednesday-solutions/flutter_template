import 'package:dio/dio.dart';
import 'package:flutter_template/flavors/flavor_config.dart';

class OpenWeatherApiKeyInterceptor extends Interceptor {
  static const String _appId = "appid";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final newOptions = options.copyWith(queryParameters: {
      ...options.queryParameters,
      _appId: FlavorConfig.values.openWeatherApiKey,
    });

    handler.next(newOptions);
  }
}
