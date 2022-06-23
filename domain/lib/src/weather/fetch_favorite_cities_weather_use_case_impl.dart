import 'package:domain/interface/weather/fetch_favorite_cities_weather_use_case.dart';
import 'package:foundation/foundation.dart';
import 'package:repository/repository.dart';

class FetchFavoriteCitiesWeatherUseCaseImpl extends FetchFavoriteCitiesWeatherUseCase {
  final WeatherRepository weatherRepository;

  FetchFavoriteCitiesWeatherUseCaseImpl({required this.weatherRepository});

  @override
  Future<void> callInternal(Unit param) async {
    await weatherRepository.fetchWeatherForFavoriteCities();
  }
}
