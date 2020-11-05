part of 'weather_bloc.dart';

@freezed
abstract class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = Initial;
  const factory WeatherState.loading() = Loading;
  const factory WeatherState.loaded(KtList<Weather> weatherList) = Loaded;
  const factory WeatherState.noCitiesSelected() = NoCitiesSelected;
  const factory WeatherState.failure(WeatherFailure failure) = Failure;
}
