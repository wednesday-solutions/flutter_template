import 'package:flutter_template_bloc/data/model/city.dart';

abstract class ICityDao {
  Stream<List<City>> watchAllCities();
  Future<List<City>> getAllCities();
  Future<List<int>> getAllIds();
  Future<void> insertCity(City city);
}