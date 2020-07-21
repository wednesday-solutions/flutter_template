
import 'package:flutter_template/database/tables/cities.dart';
import 'package:flutter_template/database/weather_database.dart';
import 'package:flutter_template/model/city.dart';
import 'package:moor/moor.dart';

part 'city_dao.g.dart';

@UseDao(tables: [Cities])
class CityDao extends DatabaseAccessor<WeatherDatabase> with _$CityDaoMixin {
  CityDao(WeatherDatabase attachedDatabase) : super(attachedDatabase);

  Stream<List<City>> allCities() {
    return select(cities).map((cityDataModel) => cityDataModel.convertToDomainModel()).watch();
  }

  Future<List<City>> allCitiesFuture() {
    return select(cities).map((cityDataModel) => cityDataModel.convertToDomainModel()).get();
  }

  void insertCity(City city) {
    into(cities).insert(city.convertToDataModel());
  }
}
