import 'package:flutter_template/flavors/flavor_config.dart';
import 'package:flutter_template/services/base/database/app_database.dart';
import 'package:flutter_template/services/base/di/dio_provider.dart';
import 'package:flutter_template/services/base/dio/interceptors/open_weather_api_key_interceptor.dart';
import 'package:flutter_template/services/preferences/preferences_service.dart';
import 'package:flutter_template/services/preferences/preferences_service_impl.dart';
import 'package:flutter_template/services/weather/local/fake_weather_local_service.dart';
import 'package:flutter_template/services/weather/local/weather_local_service.dart';
import 'package:flutter_template/services/weather/local/weather_local_service_impl.dart';
import 'package:flutter_template/services/weather/remote/fake_weather_remote_service.dart';
import 'package:flutter_template/services/weather/remote/weather_remote_service.dart';
import 'package:flutter_template/services/weather/remote/weather_remote_service_impl.dart';
import 'package:get_it/get_it.dart';

extension ServiceModule on GetIt {
  void serviceModule() {
    // Dio
    registerFactory(() => OpenWeatherApiKeyInterceptor());

    registerLazySingleton(
      () => provideDio(
        interceptors: [
          get<OpenWeatherApiKeyInterceptor>(),
        ],
      ),
    );

    // Drift
    registerLazySingleton<AppDatabase>(() => connect());

    // Shared Preferences
    registerLazySingleton<PreferencesService>(() => PreferencesServiceImpl(
          sharedPreferences: get(),
        ));

    // weather
    registerLazySingleton<WeatherRemoteService>(
      () {
        if (FlavorConfig.values.useFakeData) {
          return FakeWeatherRemoteService();
        }

        return WeatherRemoteServiceImpl(
          dio: get(),
        );
      },
    );

    registerLazySingleton<WeatherLocalService>(
      () {
        if (FlavorConfig.values.useFakeData) {
          return FakeWeatherLocalService();
        }

        return WeatherLocalServiceImpl(get());
      },
    );
  }
}
