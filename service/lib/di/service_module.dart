import 'package:foundation/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:service/interface/preferences/preferences_service.dart';
import 'package:service/interface/weather/local/weather_local_service.dart';
import 'package:service/interface/weather/remote/weather_remote_service.dart';
import 'package:service/src/base/database/app_database.dart';
import 'package:service/src/base/di/dio_provider.dart';
import 'package:service/src/base/dio/interceptors/open_weather_api_key_interceptor.dart';
import 'package:service/src/preferences/preferences_service_impl.dart';
import 'package:service/src/weather/local/fake_weather_local_service.dart';
import 'package:service/src/weather/local/weather_local_service_impl.dart';
import 'package:service/src/weather/remote/fake_weather_remote_service.dart';
import 'package:service/src/weather/remote/weather_remote_service_impl.dart';

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
    registerLazySingleton<AppDatabase>(() => AppDatabase());

    // Shared Preferences
    registerLazySingleton<PreferencesService>(() => PreferencesServiceImpl(
          sharedPreferences: get(),
        ));

    // weather
    registerLazySingleton<WeatherRemoteService>(
      () {
        if (FlavorConfig.instance.values.useFakeData) {
          return FakeWeatherRemoteService();
        }

        return WeatherRemoteServiceImpl(
          dio: get(),
        );
      },
    );

    registerLazySingleton<WeatherLocalService>(
      () {
        if (FlavorConfig.instance.values.useFakeData) {
          return FakeWeatherLocalService();
        }

        return WeatherLocalServiceImpl(get());
      },
    );
  }
}
