import 'package:flutter_template_bloc/data/datasource/network/weather_api_service_interface.dart';
import 'package:flutter_template_bloc/data/model/weather.dart';
import 'package:mockito/mockito.dart';

import 'city_mock.dart';


class MockWeatherApiService extends Mock implements IWeatherApiService {
  void mockWeatherForCity(int id, Weather mockWeather) {
    when(weatherForCity(id)).thenAnswer((realInvocation) async => mockWeather);
  }

  void mockWeatherForCityException(int id, Exception exception) {
    when(weatherForCity(id)).thenThrow(exception);
  }

  void mockSearchCities(String searchTerm, { bool mockEmpty = false }) {
    when(searchCities(searchTerm)).thenAnswer((realInvocation) async => mockEmpty ? [] : [mockCity1, mockCity2]);
  }

  void mockSearchCitiesException(String searchTerm, Exception exception) {
    when(searchCities(searchTerm)).thenThrow(exception);
  }
}
