import 'package:flutter_template/domain/entity/weather/city.dart';
import 'package:flutter_template/foundation/mapper/mapper2.dart';
import 'package:flutter_template/interactor/weather/search/ui_city_mapper.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';

abstract class CitySearchResultMapper
    extends Mapper2<List<City>, List<City>, List<UIListItem>> {}

class CitySearchResultMapperImpl extends CitySearchResultMapper {
  final UICityMapper uiCityMapper;

  CitySearchResultMapperImpl({required this.uiCityMapper});

  @override
  List<UIListItem> map(List<City> from1, List<City> from2) {
    return from2.map((searchResultCity) {
      final isFavorite = from1.any((city) => city.id == searchResultCity.id);
      return uiCityMapper.map(searchResultCity, isFavorite);
    }).toList();
  }
}
