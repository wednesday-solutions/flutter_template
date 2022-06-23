import 'package:domain/interface/weather/get_favorite_cities_stream_use_case.dart';
import 'package:domain_entity/domain_entity.dart';
import 'package:foundation/foundation.dart';
import 'package:repository/repository.dart';

class GetFavoriteCitiesStreamUseCaseImpl
    extends GetFavoriteCitiesStreamUseCase {
  final WeatherRepository weatherRepository;

  GetFavoriteCitiesStreamUseCaseImpl({required this.weatherRepository});

  @override
  Stream<List<City>> callInternal(Unit param) {
    return weatherRepository.getFavoriteCitiesStream();
  }
}
