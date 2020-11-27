import 'package:flutter_template/model/city.dart';
import 'package:flutter_template/model/consolidated_weather.dart';
import 'package:flutter_template/model/weather.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'weather_api_service.g.dart';

@RestApi(baseUrl: 'https://www.metaweather.com/api/location/')
abstract class WeatherAPIService {
  factory WeatherAPIService(Dio dio, {String baseUrl}) = _WeatherAPIService;

  @GET('/search')
  Future<List<City>> searchCities(@Query('query') String city);

  @GET('/{id}')
  Future<Weather> weatherForCity(@Path('id') int id);
}
