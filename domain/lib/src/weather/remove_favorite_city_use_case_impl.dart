import 'package:domain/interface/weather/remove_favorite_city_use_case.dart';
import 'package:domain_entity/domain_entity.dart';
import 'package:repository/repository.dart';

class RemoveFavoriteCityUseCaseImpl extends RemoveFavoriteCityUseCase {
  final WeatherRepository weatherRepository;

  RemoveFavoriteCityUseCaseImpl({required this.weatherRepository});

  @override
  Future<void> callInternal(City param) async {
    await weatherRepository.removeCityAsFavorite(param);
  }
}
