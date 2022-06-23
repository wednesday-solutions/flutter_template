import 'package:domain/interface/weather/get_favorite_cities_weather_stream_use_case.dart';
import 'package:domain_entity/domain_entity.dart';
import 'package:foundation/foundation.dart';
import 'package:repository/repository.dart';

class GetFavoriteCitiesWeatherStreamUseCaseImpl
    extends GetFavoriteCitiesWeatherStreamUseCase {
  final WeatherRepository weatherRepository;

  GetFavoriteCitiesWeatherStreamUseCaseImpl({required this.weatherRepository});

  @override
  Stream<List<Weather>> callInternal(Unit param) {
    return weatherRepository.getFavoriteCitiesWeatherStream();
  }
}
