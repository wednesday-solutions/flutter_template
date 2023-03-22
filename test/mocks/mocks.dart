import 'package:flutter_template/interactor/weather/favorite/favorite_weather_interactor.dart';
import 'package:flutter_template/interactor/weather/search/search_city_interactor.dart';
import 'package:flutter_template/navigation/weather/search/search_navigator.dart';
import 'package:flutter_template/presentation/base/intent/intent_handler.dart';
import 'package:flutter_template/presentation/entity/intent/intent.dart';
import 'package:flutter_template/repository/date/date_repository.dart';
import 'package:flutter_template/repository/weather/domain_city_mapper.dart';
import 'package:flutter_template/repository/weather/domain_weather_mapper.dart';
import 'package:flutter_template/repository/weather/local_city_mapper.dart';
import 'package:flutter_template/repository/weather/local_weather_mapper.dart';
import 'package:flutter_template/repository/weather/weather_repository.dart';
import 'package:flutter_template/services/weather/local/weather_local_service.dart';
import 'package:flutter_template/services/weather/remote/weather_remote_service.dart';
import 'package:mocktail/mocktail.dart';

// Service
class MockWeatherLocalService extends Mock implements WeatherLocalService {}

class MockWeatherRemoteService extends Mock implements WeatherRemoteService {}

// Mappers
class MockDomainCityMapper extends Mock implements DomainCityMapper {}

class MockDomainWeatherMapper extends Mock implements DomainWeatherMapper {}

class MockLocalCityMapper extends Mock implements LocalCityMapper {}

class MockLocalWeatherMapper extends Mock implements LocalWeatherMapper {}

// Repositories
class MockDateRepository extends Mock implements DateRepository {}

class MockWeatherRepository extends Mock implements WeatherRepository {}

// Interactors
class MockFavoriteWeatherInteractor extends Mock
    implements FavoriteWeatherInteractor {}

class MockSearchCityInteractor extends Mock implements SearchCityInteractor {}

// Navigator
class MockSearchNavigator extends Mock implements SearchNavigator {}

// Intent Handler
class MockIntentHandler<T extends BaseIntent> extends Mock
    implements IntentHandler<T> {}
