import 'package:domain_entity/domain_entity.dart';
import 'package:foundation/foundation.dart';
import 'package:interactor/src/weather/search/ui_city_mapper.dart';
import 'package:presentation_entity/presentation_entity.dart';

abstract class CitySearchResultMapper extends Mapper2<List<City>, List<City>, List<UIListItem>> {}

class CitySearchResultMapperImpl extends CitySearchResultMapper {
  final UICityMapper uiCityMapper;

  CitySearchResultMapperImpl({required this.uiCityMapper});

  @override
  List<UIListItem> map(List<City> from1, List<City> from2) {
    logD("map: from1 = $from1, from2 = $from2");
    return from2.map((searchResultCity) {
      final isFavorite = from1.any((city) => city.id == searchResultCity.id);
      return uiCityMapper.map(searchResultCity, isFavorite);
    }).toList();
  }
}
