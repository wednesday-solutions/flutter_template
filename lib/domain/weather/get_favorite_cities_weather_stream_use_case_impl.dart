import 'package:flutter_template/domain/entity/weather/weather.dart';
import 'package:flutter_template/domain/weather/get_favorite_cities_weather_stream_use_case.dart';
import 'package:flutter_template/foundation/unit.dart';
import 'package:flutter_template/repository/weather/weather_repository.dart';

class GetFavoriteCitiesWeatherStreamUseCaseImpl
    extends GetFavoriteCitiesWeatherStreamUseCase {
  final WeatherRepository weatherRepository;

  GetFavoriteCitiesWeatherStreamUseCaseImpl({required this.weatherRepository});

  @override
  Stream<List<Weather>> callInternal(Unit param) {
    return weatherRepository.getFavoriteCitiesWeatherStream();
  }
}
