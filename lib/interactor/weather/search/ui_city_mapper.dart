import 'package:flutter_template/domain/entity/weather/city.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';
import 'package:flutter_template/foundation/mapper/mapper2.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';

abstract class UICityMapper implements Mapper2<City, bool, UICity> {
  City mapCity(UICity from);

  UICity mapFavouriteCity(City from);

  List<UICity> mapFavouriteCityList(List<City> from) =>
      from.map(mapFavouriteCity).toList();
}

class UICityMapperImpl extends UICityMapper {
  @override
  UICity map(City from1, bool from2) {
    logD("map: from1 = $from1, from2 = $from2");
    return UICity(
      cityId: from1.id,
      title: from1.title,
      location: "${from1.lat} ${from1.lon}",
      isFavourite: from2,
      displayTitle: from1.title,
      locationType: from1.country,
      state: from1.state,
    );
  }

  @override
  UICity mapFavouriteCity(City from) {
    logD("mapFavouriteCity: from = $from");
    return UICity(
      cityId: from.id,
      title: from.title,
      location: "${from.lat} ${from.lon}",
      isFavourite: true,
      displayTitle: from.title,
      locationType: from.country,
      state: from.state,
    );
  }

  @override
  City mapCity(UICity from) {
    logD("mapCity: from = $from");
    final coords = from.location.split(" ");
    return City(
      id: from.cityId,
      title: from.title,
      country: from.locationType,
      state: from.state,
      lon: double.parse(coords.first),
      lat: double.parse(coords.last),
    );
  }
}
