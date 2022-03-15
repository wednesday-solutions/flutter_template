import 'package:flutter_template/services/base/database/app_database.dart';

final localDayWeatherList = [
  LocalDayWeatherData(
    id: 1,
    cityWoeid: 1,
    temp: 22,
    minTemp: 19,
    maxTemp: 28,
    date: DateTime(1970),
  )
];

final nowLocalDayWeatherList = [
  LocalDayWeatherData(
    id: 1,
    cityWoeid: 1,
    temp: 22,
    minTemp: 19,
    maxTemp: 28,
    date: DateTime.now(),
  )
];
