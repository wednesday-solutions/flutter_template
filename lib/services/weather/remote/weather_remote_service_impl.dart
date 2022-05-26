import 'package:dio/dio.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';
import 'package:flutter_template/services/entity/open_weather/current_weather/remote/remote_current_weather.dart';
import 'package:flutter_template/services/entity/open_weather/geo_coding/remote/remote_location.dart';
import 'package:flutter_template/services/weather/remote/weather_remote_service.dart';

class WeatherRemoteServiceImpl implements WeatherRemoteService {
  final Dio dio;

  WeatherRemoteServiceImpl({required this.dio});

  @override
  Future<RemoteCurrentWeather> currentWeather(
      {required String cityAndState}) async {
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
  Future<List<RemoteLocation>> geocodingSearch(
      {required String searchTerm}) async {
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
