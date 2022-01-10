import 'package:flutter_template/services/base/di/dio_provider.dart';
import 'package:flutter_template/services/weather/remote/weather_remote_service.dart';
import 'package:flutter_template/services/weather/remote/weather_remote_service_impl.dart';
import 'package:get_it/get_it.dart';

extension ServiceModule on GetIt {
  void serviceModule() {
    // Dio
    registerLazySingleton(() => provideDio());

    // weather
    registerLazySingleton<WeatherRemoteService>(
      () => WeatherRemoteServiceImpl(
        dio: get(),
      ),
    );
  }
}
