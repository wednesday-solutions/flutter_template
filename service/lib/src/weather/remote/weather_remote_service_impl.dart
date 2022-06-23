import 'package:dio/dio.dart';
import 'package:foundation/foundation.dart';
import 'package:service_entity/service_entity.dart';
import 'package:service/interface/weather/remote/weather_remote_service.dart';
import 'package:service_entity/service_entity.dart';

class WeatherRemoteServiceImpl implements WeatherRemoteService {
  final Dio dio;

  WeatherRemoteServiceImpl({required this.dio});

  @override
  Future<RemoteCurrentWeather> currentWeather({required String cityAndState}) async {
    logD("currentWeather: cityAndState = $cityAndState");
    final response = await dio.get(
      "data/2.5/weather?units=metric",
      queryParameters: {
        "q": cityAndState,
      },
    );

    return RemoteCurrentWeather.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<List<RemoteLocation>> geocodingSearch({required String searchTerm}) async {
    logD("geocodingSearch: searchTerm = $searchTerm");
    final response = await dio.get(
      "geo/1.0/direct",
      queryParameters: {
        "q": searchTerm,
        "limit": 5,
      },
    );

    return (response.data as List)
        .map((e) => RemoteLocation.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
