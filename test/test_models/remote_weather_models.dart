import 'package:flutter_template/services/entity/weather/remote/remote_consolidated_weather.dart';
import 'package:flutter_template/services/entity/weather/remote/remote_weather.dart';

final remoteWeather = RemoteWeather(
  "title 1",
  [
    RemoteConsolidatedWeather(
      1,
      19,
      28,
      22,
      DateTime(1970),
    )
  ],
);
