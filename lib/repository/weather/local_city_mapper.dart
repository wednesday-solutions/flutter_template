import 'package:drift/drift.dart';
import 'package:flutter_template/domain/entity/weather/city.dart';
import 'package:flutter_template/services/base/database/app_database.dart';
import 'package:foundation/foundation.dart';

abstract class LocalCityMapper extends Mapper<City, LocalLocationCompanion> {}

class LocalCityMapperImpl extends LocalCityMapper {
  @override
  LocalLocationCompanion map(City from) {
    logD("map: from = $from");
    return LocalLocationCompanion(
        country: Value(from.country),
        lat: Value(from.lat),
        lon: Value(from.lon),
        name: Value(from.title),
        state: Value.ofNullable(from.state));
  }
}
