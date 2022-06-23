import 'package:mocktail/mocktail.dart';
import 'package:repository/repository.dart';
import 'package:repository/src/weather/domain_city_mapper.dart';
import 'package:repository/src/weather/domain_weather_mapper.dart';
import 'package:repository/src/weather/local_city_mapper.dart';
import 'package:repository/src/weather/local_weather_mapper.dart';
import 'package:service/interface/interface.dart';

class MockWeatherLocalService extends Mock implements WeatherLocalService {}

class MockWeatherRemoteService extends Mock implements WeatherRemoteService {}

class MockDomainCityMapper extends Mock implements DomainCityMapper {}

class MockDomainWeatherMapper extends Mock implements DomainWeatherMapper {}

class MockLocalCityMapper extends Mock implements LocalCityMapper {}

class MockLocalWeatherMapper extends Mock implements LocalWeatherMapper {}

class MockDateRepository extends Mock implements DateRepository {}
