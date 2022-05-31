import 'package:flutter_template/domain/datetime/date_in_millis_use_case.dart';
import 'package:flutter_template/domain/datetime/date_in_millis_use_case_impl.dart';
import 'package:flutter_template/domain/datetime/format_date_use_case.dart';
import 'package:flutter_template/domain/datetime/format_date_use_case_impl.dart';
import 'package:flutter_template/domain/theme/get_is_dynamic_theme_enabled.dart';
import 'package:flutter_template/domain/theme/get_is_dynamic_theme_enabled_impl.dart';
import 'package:flutter_template/domain/theme/get_theme_mode_use_case.dart';
import 'package:flutter_template/domain/theme/get_theme_mode_use_case_impl.dart';
import 'package:flutter_template/domain/theme/set_is_dynamic_theme_enabled.dart';
import 'package:flutter_template/domain/theme/set_is_dynamic_theme_enabled_impl.dart';
import 'package:flutter_template/domain/theme/set_theme_mode_use_case.dart';
import 'package:flutter_template/domain/theme/set_theme_mode_use_case_impl.dart';
import 'package:flutter_template/domain/weather/fetch_favorite_cities_weather_use_case.dart';
import 'package:flutter_template/domain/weather/fetch_favorite_cities_weather_use_case_impl.dart';
import 'package:flutter_template/domain/weather/get_favorite_cities_stream_use_case.dart';
import 'package:flutter_template/domain/weather/get_favorite_cities_stream_use_case_impl.dart';
import 'package:flutter_template/domain/weather/get_favorite_cities_weather_stream_use_case.dart';
import 'package:flutter_template/domain/weather/get_favorite_cities_weather_stream_use_case_impl.dart';
import 'package:flutter_template/domain/weather/remove_favorite_city_use_case.dart';
import 'package:flutter_template/domain/weather/remove_favorite_city_use_case_impl.dart';
import 'package:flutter_template/domain/weather/search_cities_use_case.dart';
import 'package:flutter_template/domain/weather/search_cities_use_case_impl.dart';
import 'package:flutter_template/domain/weather/set_city_favorite_use_case.dart';
import 'package:flutter_template/domain/weather/set_city_favorite_use_case_impl.dart';
import 'package:get_it/get_it.dart';

extension DomainModule on GetIt {
  void domainModule() {
    // weather
    registerFactory<FetchFavoriteCitiesWeatherUseCase>(
      () => FetchFavoriteCitiesWeatherUseCaseImpl(
        weatherRepository: get(),
      ),
    );

    registerFactory<GetFavoriteCitiesStreamUseCase>(
      () => GetFavoriteCitiesStreamUseCaseImpl(
        weatherRepository: get(),
      ),
    );

    registerFactory<GetFavoriteCitiesWeatherStreamUseCase>(
      () => GetFavoriteCitiesWeatherStreamUseCaseImpl(
        weatherRepository: get(),
      ),
    );

    registerFactory<RemoveFavoriteCityUseCase>(
      () => RemoveFavoriteCityUseCaseImpl(
        weatherRepository: get(),
      ),
    );

    registerFactory<SearchCitiesUseCase>(
      () => SearchCitiesUseCaseImpl(
        weatherRepository: get(),
      ),
    );

    registerFactory<SetCityFavoriteUseCase>(
      () => SetCityFavoriteUseCaseImpl(
        weatherRepository: get(),
      ),
    );

    // date
    registerFactory<DateInMillisUseCase>(() => DateInMillisUseCaseImpl(
          dateRepository: get(),
        ));

    registerFactory<FormatDateUseCase>(() => FormatDateUseCaseImpl(
          dateRepository: get(),
        ));

    // theme
    registerFactory<SetThemeModeUseCase>(() => SetThemeModeUseCaseImpl(
          themeRepository: get(),
        ));

    registerFactory<GetThemeModeUseCase>(() => GetThemeModeUseCaseImpl(
          themeRepository: get(),
        ));

    registerFactory<SetIsDynamicThemeEnabled>(
        () => SetIsDynamicThemeEnabledImpl(
              themeRepository: get(),
            ));

    registerFactory<GetIsDynamicThemeEnabled>(
        () => GetIsDynamicThemeEnabledImpl(
              themeRepository: get(),
            ));
  }
}
