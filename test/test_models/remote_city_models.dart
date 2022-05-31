import 'package:flutter_template/services/entity/open_weather/geo_coding/remote/remote_location.dart';

final allRemoteCityList = [
  remoteCity1,
  remoteCity2,
];

final remoteCity1 = RemoteLocation(
  name: "name 1",
  country: "country 1",
  lat: 100.45,
  lon: 90.12,
  state: "state 1",
);

final remoteCity2 = RemoteLocation(
  name: "name 2",
  country: "country 2",
  lat: -45.45,
  lon: 19.55,
  state: "state 2",
);
