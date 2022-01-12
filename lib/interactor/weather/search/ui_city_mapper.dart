import 'package:flutter_template/domain/model/weather/city.dart';
import 'package:flutter_template/foundation/mapper/mapper2.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';

abstract class UICityMapper extends Mapper2<City, bool, UICity> {}

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
}
