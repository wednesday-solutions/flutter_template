import 'package:flutter_template_bloc/data/datasource/local/weather_database.dart';
import 'package:flutter_template_bloc/data/model/city.dart';
import 'package:moor/moor.dart';

@DataClassName('CityDataModel')
class Cities extends Table {
  IntColumn get woeid => integer().customConstraint('UNIQUE')();
  TextColumn get title => text()();
  TextColumn get locationType => text()();
}

extension CityDataModelToDomainModel on CityDataModel {
  City convertToDomainModel() {
    return City(woeid, title, locationType);
  }
}

extension CityToDataModel on City {
  CityDataModel convertToDataModel() {
    return CityDataModel(
      title: title,
      woeid: woeid,
      locationType: locationType
    );
  }
}
