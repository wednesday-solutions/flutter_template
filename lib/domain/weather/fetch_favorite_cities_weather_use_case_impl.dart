import 'package:flutter_template/domain/weather/fetch_favorite_cities_weather_use_case.dart';
import 'package:flutter_template/foundation/unit.dart';
import 'package:flutter_template/repository/weather/weather_repository.dart';

class FetchFavoriteCitiesWeatherUseCaseImpl
    extends FetchFavoriteCitiesWeatherUseCase {
  final WeatherRepository weatherRepository;

  FetchFavoriteCitiesWeatherUseCaseImpl({required this.weatherRepository});

  @override
  Future<void> callInternal(Unit param) async {
    await weatherRepository.fetchWeatherForFavoriteCities();
  }
}
