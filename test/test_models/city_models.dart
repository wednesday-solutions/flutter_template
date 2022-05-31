import 'package:flutter_template/domain/entity/weather/city.dart';

final singleCityList = [
  city1,
];

final allCityList = [
  city1,
  city2,
];

final city1 = City(
  id: 1,
  title: "name 1",
  lat: 100.45,
  lon: 90.12,
  state: "state 1",
  country: "country 1",
);

final city2 = City(
  id: 2,
  title: "name 2",
  country: "country 2",
  state: "state 2",
  lat: -45.45,
  lon: 19.55,
);
