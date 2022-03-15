import 'package:flutter_template/services/base/database/app_database.dart';

final singleLocalCityDataList = [
  localCityData1,
];

final allLocalCityDataList = [
  localCityData1,
  localCityData2,
];

final localCityData1 = LocalCityData(
  woeid: 1,
  title: "title 1",
  locationType: "locationType 1",
  location: "location 1",
);

final localCityData2 = LocalCityData(
  woeid: 2,
  title: "title 2",
  locationType: "locationType 2",
  location: "location 2",
);
