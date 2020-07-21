import 'package:flutter_template/database/weather_database.dart';
import 'package:flutter_template/model/city.dart';
import 'package:moor/moor.dart';

@DataClassName('CityDataModel')
class Cities extends Table {
  IntColumn get woeid => integer().customConstraint('UNIQUE')();
  TextColumn get title => text()();
  TextColumn get locationType => text()();
}

extension CityDataModelToDomainModel on CityDataModel {
  City convertToDomainModel() {
    return City(this.woeid, this.title, this.locationType);
  }
}

extension CityToDataModel on City {
  CityDataModel convertToDataModel() {
    return CityDataModel(
      title: this.title,
      woeid: this.woeid,
      locationType: this.locationType
    );
  }
}
