import 'package:dartz/dartz.dart';
import 'package:flutter_template_bloc/core/failures/city_failure.dart';
import 'package:flutter_template_bloc/core/failures/weather_failure.dart';
import 'package:flutter_template_bloc/data/model/city.dart';
import 'package:flutter_template_bloc/data/model/weather.dart';
import 'package:flutter_template_bloc/data/repository/weather_repository.dart';
import 'package:kt_dart/collection.dart';
import 'package:mockito/mockito.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {
  void mockEmptyWatchWeatherResponse() {
    mockWatchWeatherResponse(const KtList.empty());
  }

  void mockWatchWeatherResponse(KtList<Weather> list) {
    when(watchWeatherForAllCities()).thenAnswer(
      (realInvocation) =>
          Stream.fromIterable([right<WeatherFailure, KtList<Weather>>(list)]),
    );
  }

  void mockWatchWeatherFailureResponse(WeatherFailure failure) {
    when(watchWeatherForAllCities()).thenAnswer((realInvocation) =>
        Stream.fromIterable([left<WeatherFailure, KtList<Weather>>(failure)]));
  }

  void mockSearchCitiesResponse(String searchTerm, KtList<City> citiesList) {
    when(searchCities(searchTerm: searchTerm)).thenAnswer(
        (realInvocation) async => right<CityFailure, KtList<City>>(citiesList));
  }

  void mockSearchCitiesFailureResponse(String searchTerm, CityFailure failure) {
    when(searchCities(searchTerm: searchTerm)).thenAnswer(
        (realInvocation) async => left<CityFailure, KtList<City>>(failure));
  }
}
