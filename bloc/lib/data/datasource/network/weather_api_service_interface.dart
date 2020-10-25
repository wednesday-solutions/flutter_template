
import 'package:flutter_template_bloc/data/model/city.dart';
import 'package:flutter_template_bloc/data/model/weather.dart';

abstract class IWeatherApiService {
  Future<List<City>> searchCities(String city);
  Future<Weather> weatherForCity(int id);
}