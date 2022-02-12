import 'package:flutter_template/domain/entity/weather/city.dart';
import 'package:flutter_template/foundation/mapper/mapper.dart';
import 'package:flutter_template/services/base/database/app_database.dart';
import 'package:flutter_template/services/entity/weather/remote/remote_city.dart';

abstract class DomainCityMapper extends Mapper<LocalCityData, City> {
  City mapRemoteCity(RemoteCity from);

  List<City> mapRemoteCityList(List<RemoteCity> from) =>
      from.map((e) => mapRemoteCity(e)).toList();
}

class DomainCityMapperImpl extends DomainCityMapper {
  @override
  City map(LocalCityData from) {
    return City(
      id: from.woeid,
      title: from.title,
      locationType: from.locationType,
      location: from.location,
    );
  }

  @override
  City mapRemoteCity(RemoteCity from) {
    return City(
      id: from.woeid,
      title: from.title,
      locationType: from.locationType,
      location: from.location,
    );
  }
}
