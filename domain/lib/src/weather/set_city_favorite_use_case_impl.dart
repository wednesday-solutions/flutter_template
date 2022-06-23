import 'package:domain/interface/weather/set_city_favorite_use_case.dart';
import 'package:domain_entity/domain_entity.dart';
import 'package:repository/repository.dart';

class SetCityFavoriteUseCaseImpl extends SetCityFavoriteUseCase {
  final WeatherRepository weatherRepository;

  SetCityFavoriteUseCaseImpl({required this.weatherRepository});

  @override
  Future<void> callInternal(City param) async {
    await weatherRepository.setCityAsFavorite(param);
  }
}
