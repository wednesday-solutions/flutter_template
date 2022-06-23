import 'package:domain/interface/weather/search_cities_use_case.dart';
import 'package:domain_entity/domain_entity.dart';
import 'package:repository/repository.dart';

class SearchCitiesUseCaseImpl extends SearchCitiesUseCase {
  final WeatherRepository weatherRepository;

  SearchCitiesUseCaseImpl({required this.weatherRepository});

  @override
  Future<List<City>> callInternal(String param) async {
    return await weatherRepository.searchCities(param);
  }
}
