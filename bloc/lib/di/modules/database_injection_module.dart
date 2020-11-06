

import 'package:flutter_template_bloc/data/datasource/local/weather_database.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DatabaseInjectionModule {

  @LazySingleton()
  WeatherDatabase weatherDatabase() {
    return WeatherDatabase(WeatherDatabase.openConnection());
  }
}