import 'package:flutter_template/domain/entity/weather/city.dart';
import 'package:flutter_template/domain/weather/remove_favorite_city_use_case.dart';
import 'package:flutter_template/repository/weather/weather_repository.dart';

class RemoveFavoriteCityUseCaseImpl extends RemoveFavoriteCityUseCase {
  final WeatherRepository weatherRepository;

  RemoveFavoriteCityUseCaseImpl({required this.weatherRepository});

  @override
  Future<void> callInternal(City param) async {
    await weatherRepository.removeCityAsFavorite(param);
  }
}
