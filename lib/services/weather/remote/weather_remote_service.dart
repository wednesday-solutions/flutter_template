import 'package:flutter_template/services/entity/open_weather/current_weather/remote/remote_current_weather.dart';
import 'package:flutter_template/services/entity/open_weather/geo_coding/remote/remote_location.dart';

abstract interface class WeatherRemoteService {
  Future<List<RemoteLocation>> geocodingSearch({required String searchTerm});

  Future<RemoteCurrentWeather> currentWeather({required String cityAndState});
}
