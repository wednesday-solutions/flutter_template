import 'package:flutter_template/domain/entity/weather/city.dart';
import 'package:flutter_template/domain/weather/set_city_favorite_use_case.dart';
import 'package:flutter_template/repository/weather/weather_repository.dart';

class SetCityFavoriteUseCaseImpl extends SetCityFavoriteUseCase {
  final WeatherRepository weatherRepository;

  SetCityFavoriteUseCaseImpl({required this.weatherRepository});

  @override
  Future<void> callInternal(City param) async {
    await weatherRepository.setCityAsFavorite(param);
  }
}
