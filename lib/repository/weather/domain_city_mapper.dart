import 'package:flutter_template/domain/entity/weather/city.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';
import 'package:flutter_template/foundation/mapper/mapper.dart';
import 'package:flutter_template/services/base/database/app_database.dart';
import 'package:flutter_template/services/entity/open_weather/geo_coding/remote/remote_location.dart';

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
