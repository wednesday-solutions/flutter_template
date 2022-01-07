import 'package:flutter_template/services/model/weather/remote_city.dart';

abstract class WeatherRemoteService {
  Future<List<RemoteCity>> searchCities({required String searchTerm});
}
