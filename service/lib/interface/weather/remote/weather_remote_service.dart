import 'package:service_entity/service_entity.dart';

abstract class WeatherRemoteService {
  Future<List<RemoteLocation>> geocodingSearch({required String searchTerm});

  Future<RemoteCurrentWeather> currentWeather({required String cityAndState});
}
