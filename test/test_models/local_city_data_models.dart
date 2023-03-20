import 'package:flutter_template/services/base/database/app_database.dart';

final singleLocalCityDataList = [
  localCityData1,
];

final allLocalCityDataList = [
  localCityData1,
  localCityData2,
];

const localCityData1 = LocalLocationData(
  name: "name 1",
  country: "country 1",
  lat: 100.45,
  lon: 90.12,
  state: "state 1",
);

const localCityData2 = LocalLocationData(
  name: "name 2",
  country: "country 2",
  lat: -45.45,
  lon: 19.55,
  state: "state 2",
);
