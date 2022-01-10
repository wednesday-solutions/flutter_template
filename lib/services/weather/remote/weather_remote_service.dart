import 'package:flutter_template/services/model/city/remote_city.dart';
import 'package:flutter_template/services/model/weather/remote_weather.dart';

abstract class WeatherRemoteService {
  Future<List<RemoteCity>> searchCities({required String searchTerm});

  Future<RemoteWeather> weatherForCity({required int id});
}
