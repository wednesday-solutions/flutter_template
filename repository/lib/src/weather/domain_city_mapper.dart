import 'package:domain_entity/domain_entity.dart';
import 'package:foundation/foundation.dart';
import 'package:service/service.dart';
import 'package:service_entity/service_entity.dart';

abstract class DomainCityMapper extends Mapper<LocalLocationData, City> {
  City mapRemoteCity(RemoteLocation from);

  List<City> mapRemoteCityList(List<RemoteLocation> from) =>
      from.map((e) => mapRemoteCity(e)).toList();
}

class DomainCityMapperImpl extends DomainCityMapper {
  @override
  City map(LocalLocationData from) {
    logD("map: from = $from");
    return City(
      id: (from.lat + from.lon).toInt(),
      title: from.name,
      country: from.country,
      state: from.state,
      lat: from.lat,
      lon: from.lon,
    );
  }

  @override
  City mapRemoteCity(RemoteLocation from) {
    logD("mapRemoteCity: from = $from");
    return City(
      id: (from.lat + from.lon).toInt(),
      title: from.name,
      country: from.country,
      state: from.state,
      lat: from.lat,
      lon: from.lon,
    );
  }
}
