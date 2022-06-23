import 'package:service/entity/entity.dart';

abstract class WeatherRemoteService {
  Future<List<RemoteLocation>> geocodingSearch({required String searchTerm});

  Future<RemoteCurrentWeather> currentWeather({required String cityAndState});
}
