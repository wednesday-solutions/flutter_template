import 'package:dio/dio.dart';
import 'package:flutter_template/services/model/weather/remote_city.dart';
import 'package:flutter_template/services/weather/weather_remote_service.dart';

class WeatherRemoteServiceImpl extends WeatherRemoteService {
  final Dio dio;

  WeatherRemoteServiceImpl({required this.dio}) {}

  @override
  Future<List<RemoteCity>> searchCities({required String searchTerm}) async {
    final response = await dio.get(
      "/api/location/search",
      queryParameters: {
        "query": searchTerm,
      },
    );
    return (response.data as List)
        .map((e) => RemoteCity.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
