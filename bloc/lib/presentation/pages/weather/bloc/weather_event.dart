part of 'weather_bloc.dart';

@freezed
abstract class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.watchWeatherForAllCities() = _WatchWeatherForAllCities;
  const factory WeatherEvent.weatherListLoaded(Either<WeatherFailure, KtList<Weather>> weatherList) = _WeatherListLoaded;
}