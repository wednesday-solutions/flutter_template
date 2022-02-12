import 'package:flutter_template/services/entity/weather/remote/remote_city.dart';
import 'package:flutter_template/services/entity/weather/remote/remote_weather.dart';

abstract class WeatherRemoteService {
  Future<List<RemoteCity>> searchCities({required String searchTerm});

  Future<RemoteWeather> weatherForCity({required int id});
}
