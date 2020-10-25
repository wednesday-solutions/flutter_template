import 'package:flutter_template_bloc/data/datasource/network/weather_api_service_interface.dart';
import 'package:flutter_template_bloc/data/model/city.dart';
import 'package:flutter_template_bloc/data/model/weather.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'weather_api_service.g.dart';

@RestApi(baseUrl: 'https://www.metaweather.com/api/location/')
abstract class WeatherAPIService implements IWeatherApiService{
  factory WeatherAPIService(Dio dio, {String baseUrl}) = _WeatherAPIService;

  @override
  @GET('/search')
  Future<List<City>> searchCities(@Query('query') String city);

  @override
  @GET('/{id}')
  Future<Weather> weatherForCity(@Path('id') int id);
}
