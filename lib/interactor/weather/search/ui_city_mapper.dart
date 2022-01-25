import 'package:flutter_template/domain/entity/weather/city.dart';
import 'package:flutter_template/foundation/mapper/mapper2.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';

abstract class UICityMapper extends Mapper2<City, bool, UICity> {
  City mapCity(UICity from);

  UICity mapFavouriteCity(City from);

  List<UICity> mapFavouriteCityList(List<City> from) =>
      from.map(mapFavouriteCity).toList();
}

class UICityMapperImpl extends UICityMapper {
  @override
  UICity map(City from1, bool from2) {
    return UICity(
      cityId: from1.id,
      title: from1.title,
      locationType: from1.locationType,
      location: from1.location,
      isFavourite: from2,
    );
  }

  @override
  UICity mapFavouriteCity(City from) {
    return UICity(
      cityId: from.id,
      title: from.title,
      locationType: from.locationType,
      location: from.location,
      isFavourite: true,
    );
  }

  @override
  City mapCity(UICity from) {
    return City(
      id: from.cityId,
      title: from.title,
      locationType: from.locationType,
      location: from.location,
    );
  }
}
