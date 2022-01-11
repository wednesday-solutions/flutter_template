import 'package:flutter_template/services/base/database/app_database.dart';
import 'package:flutter_template/services/base/di/dio_provider.dart';
import 'package:flutter_template/services/weather/local/weather_local_service.dart';
import 'package:flutter_template/services/weather/local/weather_local_service_impl.dart';
import 'package:flutter_template/services/weather/remote/weather_remote_service.dart';
import 'package:flutter_template/services/weather/remote/weather_remote_service_impl.dart';
import 'package:get_it/get_it.dart';

extension ServiceModule on GetIt {
  void serviceModule() {
    // Dio
    registerLazySingleton(() => provideDio());

    // Drift
    registerLazySingleton<AppDatabase>(() => AppDatabase());

    // weather
    registerLazySingleton<WeatherRemoteService>(
      () => WeatherRemoteServiceImpl(
        dio: get(),
      ),
    );

    registerLazySingleton<WeatherLocalService>(
      () => WeatherLocalServiceImpl(get()),
    );
  }
}
