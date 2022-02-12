import 'package:dio/dio.dart';
import 'package:flutter_template/services/entity/weather/remote/remote_city.dart';
import 'package:flutter_template/services/entity/weather/remote/remote_weather.dart';
import 'package:flutter_template/services/weather/remote/weather_remote_service.dart';

class WeatherRemoteServiceImpl implements WeatherRemoteService {
  final Dio dio;

  WeatherRemoteServiceImpl({required this.dio});

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

  @override
  Future<RemoteWeather> weatherForCity({required int id}) async {
    final response = await dio.get("/api/location/$id");

    final json = (response.data as Map<String, dynamic>);
    return RemoteWeather.fromJson(json);
  }
}
