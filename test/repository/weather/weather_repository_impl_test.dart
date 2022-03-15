import 'package:flutter_template/domain/entity/base/datetime/date.dart';
import 'package:flutter_template/repository/date/date_repository.dart';
import 'package:flutter_template/repository/weather/domain_city_mapper.dart';
import 'package:flutter_template/repository/weather/domain_weather_mapper.dart';
import 'package:flutter_template/repository/weather/local_city_mapper.dart';
import 'package:flutter_template/repository/weather/local_day_weather_mapper.dart';
import 'package:flutter_template/repository/weather/local_weather_mapper.dart';
import 'package:flutter_template/repository/weather/weather_repository.dart';
import 'package:flutter_template/repository/weather/weather_repository_impl.dart';
import 'package:flutter_template/services/weather/local/weather_local_service.dart';
import 'package:flutter_template/services/weather/remote/weather_remote_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../exception/test_exceptions.dart';
import '../../mocks/mocks.dart';
import '../../test_models/city_models.dart';
import '../../test_models/local_city_data_models.dart';
import '../../test_models/local_city_with_weather_models.dart';
import '../../test_models/local_day_weather_companion.dart';
import '../../test_models/local_day_weather_models.dart';
import '../../test_models/local_weather_companion_models.dart';
import '../../test_models/remote_weather_models.dart';
import '../../test_models/weather_models.dart';

void main() {
  late WeatherLocalService weatherLocalService;
  late WeatherRemoteService weatherRemoteService;
  late DomainCityMapper domainCityMapper;
  late DomainWeatherMapper domainWeatherMapper;
  late LocalCityMapper localCityMapper;
  late LocalWeatherMapper localWeatherMapper;
  late LocalDayWeatherMapper localDayWeatherMapper;
  late DateRepository dateRepository;

  late WeatherRepository weatherRepository;

  setUp(() {
    weatherLocalService = MockWeatherLocalService();
    weatherRemoteService = MockWeatherRemoteService();
    domainCityMapper = MockDomainCityMapper();
    domainWeatherMapper = MockDomainWeatherMapper();
    localCityMapper = MockLocalCityMapper();
    localWeatherMapper = MockLocalWeatherMapper();
    localDayWeatherMapper = MockLocalDayWeatherMapper();
    dateRepository = MockDateRepository();

    weatherRepository = WeatherRepositoryImpl(
      weatherLocalService: weatherLocalService,
      weatherRemoteService: weatherRemoteService,
      domainCityMapper: domainCityMapper,
      domainWeatherMapper: domainWeatherMapper,
      localCityMapper: localCityMapper,
      localWeatherMapper: localWeatherMapper,
      localDayWeatherMapper: localDayWeatherMapper,
      dateRepository: dateRepository,
    );
  });

  tearDown(() {
    resetMocktailState();
  });

  test(
      "Given local service returns list of LocalCityData, When getFavoriteCitiesList is called, Then Future<List<City>> is returned",
      () async {
    // Given
    final localCityData = singleLocalCityDataList;
    final cityData = singleCityList;
    when(() => weatherLocalService.getFavouriteCities())
        .thenAnswer((_) => Future.value(localCityData));
    when(() => domainCityMapper.mapList(localCityData)).thenReturn(cityData);

    // When
    final result = await weatherRepository.getFavoriteCitiesList();

    // Then
    verify(() => weatherLocalService.getFavouriteCities()).called(1);
    verify(() => domainCityMapper.mapList(localCityData)).called(1);
    expect(result.length, localCityData.length);
    expect(result, cityData);
  });

  test(
      "Given local service throws error, When getFavoriteCitiesList is called, Then same error is thrown",
      () async {
    // Given
    final testException = TestException();
    when(() => weatherLocalService.getFavouriteCities())
        .thenThrow(testException);

    // When
    expect(
      () async => await weatherRepository.getFavoriteCitiesList(),
      throwsA(same(testException)),
    );

    // Then
    verify(() => weatherLocalService.getFavouriteCities()).called(1);
    verifyZeroInteractions(domainCityMapper);
  });

  test(
      "Given local services returns stream of local city data, When getFavoriteCitiesStream is called, then Stream<List<City>> is returned",
      () {
    // Given
    final localCityData = singleLocalCityDataList;
    final cityData = singleCityList;
    when(() => weatherLocalService.getFavoriteCitiesStream())
        .thenAnswer((_) => Stream.value(localCityData));
    when(() => domainCityMapper.mapList(localCityData)).thenReturn(cityData);

    // When
    weatherRepository.getFavoriteCitiesStream().listen(
          expectAsync1(
            (localCityList) {
              // Then
              expect(localCityList, cityData);
              verify(() => weatherLocalService.getFavoriteCitiesStream())
                  .called(1);
              verify(() => domainCityMapper.mapList(localCityData)).called(1);
            },
            count: 1,
          ),
        );
  });

  test(
      "Given local service returns list of LocalCityWithWeather, When getFavoriteCitiesWeatherList is called, then Future<List<Weather>> is returned",
      () async {
    // Given
    final localCityWithWeather = localCityWithWeatherList;
    final weatherData = weatherList;
    when(() => weatherLocalService.getFavoriteCitiesWeatherList())
        .thenAnswer((invocation) => Future.value(localCityWithWeather));
    when(() => domainWeatherMapper.mapList(localCityWithWeather))
        .thenReturn(weatherData);

    // When
    final result = await weatherRepository.getFavoriteCitiesWeatherList();

    // Then
    verify(() => weatherLocalService.getFavoriteCitiesWeatherList()).called(1);
    verify(() => domainWeatherMapper.mapList(localCityWithWeather)).called(1);
    expect(result, same(weatherData));
  });

  test(
      "Given local service throws exception, When getFavoriteCitiesWeatherList is called, then same exception is thrown",
      () async {
    // Given
    final testException = TestException();
    when(() => weatherLocalService.getFavoriteCitiesWeatherList())
        .thenThrow(testException);

    // When
    expect(
      () async => await weatherRepository.getFavoriteCitiesWeatherList(),
      throwsA(same(testException)),
    );

    // Then
    verify(() => weatherLocalService.getFavoriteCitiesWeatherList()).called(1);
    verifyZeroInteractions(domainWeatherMapper);
  });

  test(
      "Given local service returns Stream<List<LocalCityWithWeather>>, When getFavoriteCitiesWeatherStream is called, Then Stream<List<Weather>> is returned",
      () {
    // Given
    final localCityWithWeather = localCityWithWeatherList;
    final weatherData = weatherList;
    when(() => weatherLocalService.getFavoriteCitiesWeatherStream())
        .thenAnswer((invocation) => Stream.value(localCityWithWeather));
    when(() => domainWeatherMapper.mapList(localCityWithWeather))
        .thenReturn(weatherData);

    // When
    weatherRepository.getFavoriteCitiesWeatherStream().listen(
          expectAsync1(
            (data) {
              // Then
              expect(data, same(weatherData));
              verify(() => weatherLocalService.getFavoriteCitiesWeatherStream())
                  .called(1);
              verify(() => domainWeatherMapper.mapList(localCityWithWeather))
                  .called(1);
            },
            count: 1,
          ),
        );
  });

  test(
      "Given getFavouriteCities returns empty list, When fetchWeatherForFavoriteCities is called, No processing should happen",
      () async {
    // Given
    const date = Date(year: 1970, month: 1, day: 1);
    when(() => dateRepository.todayDate()).thenReturn(date);
    when(() => weatherLocalService.getFavouriteCities())
        .thenAnswer((_) => Future.value(List.empty()));

    // When
    await weatherRepository.fetchWeatherForFavoriteCities();

    // Then
    verify(() => dateRepository.todayDate()).called(1);
    verify(() => weatherLocalService.getFavouriteCities()).called(1);
    verifyNoMoreInteractions(dateRepository);
    verifyNoMoreInteractions(weatherLocalService);
    verifyZeroInteractions(weatherRemoteService);
    verifyZeroInteractions(localDayWeatherMapper);
    verifyZeroInteractions(localWeatherMapper);
  });

  test(
      "Given dayWeatherList is empty, When fetchWeatherForFavoriteCities is called, weather should be fetch from remote and updated in local",
      () async {
    // Given
    const date = Date(year: 1970, month: 1, day: 1);
    final localCityData = singleLocalCityDataList;
    final localCity = localCityData.first;
    final remoteWeatherData = remoteWeather;
    const localWeatherCompanionData = localWeatherCompanion;
    final localDayWeatherCompanionData = localDayWeatherCompanionList;
    when(() => dateRepository.todayDate()).thenReturn(date);
    when(() => weatherLocalService.getFavouriteCities())
        .thenAnswer((_) => Future.value(localCityData));
    when(() =>
            weatherLocalService.getLocalDayWeather(woeid: any(named: "woeid")))
        .thenAnswer((_) => Future.value(List.empty()));
    when(() => dateRepository.mapDartDateTimeToDate(any())).thenReturn(date);
    when(() => weatherRemoteService.weatherForCity(id: any(named: "id")))
        .thenAnswer((_) => Future.value(remoteWeatherData));
    when(() => localWeatherMapper.map(remoteWeatherData, localCity.woeid))
        .thenReturn(localWeatherCompanionData);
    when(() => localDayWeatherMapper.map(remoteWeatherData, localCity.woeid))
        .thenReturn((localDayWeatherCompanionData));
    when(
      () => weatherLocalService.deleteCurrentAndAddNewWeatherData(
        woeid: localCity.woeid,
        weather: localWeatherCompanionData,
        weatherList: localDayWeatherCompanionData,
      ),
    ).thenAnswer((_) => Future.value());

    // When
    await weatherRepository.fetchWeatherForFavoriteCities();

    // Then
    verify(() => dateRepository.todayDate()).called(1);
    verify(() => weatherLocalService.getFavouriteCities()).called(1);
    verify(() => weatherLocalService.getLocalDayWeather(woeid: 1)).called(1);
    verifyNever(() => dateRepository.mapDartDateTimeToDate(any()));
    verify(() => weatherRemoteService.weatherForCity(id: localCity.woeid))
        .called(1);
    verify(() => localWeatherMapper.map(remoteWeatherData, localCity.woeid))
        .called(1);
    verify(() => localDayWeatherMapper.map(remoteWeatherData, localCity.woeid))
        .called(1);
    verify(() => weatherLocalService.deleteCurrentAndAddNewWeatherData(
          woeid: localCity.woeid,
          weather: localWeatherCompanionData,
          weatherList: localDayWeatherCompanionData,
        )).called(1);
  });

  test(
      "Given weather list is stale, When fetchWeatherForFavoriteCities is called, weather should be fetch from remote and updated in local",
      () async {
    // Given
    const date = Date(year: 1970, month: 1, day: 1);
    const nowDate = Date(year: 2021, month: 1, day: 31);
    final localCityData = singleLocalCityDataList;
    final localCity = localCityData.first;
    final remoteWeatherData = remoteWeather;
    const localWeatherCompanionData = localWeatherCompanion;
    final localDayWeatherCompanionData = localDayWeatherCompanionList;
    final localDayWeatherData = nowLocalDayWeatherList;
    when(() => dateRepository.todayDate()).thenReturn(date);
    when(() => weatherLocalService.getFavouriteCities())
        .thenAnswer((_) => Future.value(localCityData));
    when(() =>
            weatherLocalService.getLocalDayWeather(woeid: any(named: "woeid")))
        .thenAnswer((_) => Future.value(localDayWeatherData));
    when(() => dateRepository.mapDartDateTimeToDate(any())).thenReturn(nowDate);
    when(() => weatherRemoteService.weatherForCity(id: any(named: "id")))
        .thenAnswer((_) => Future.value(remoteWeatherData));
    when(() => localWeatherMapper.map(remoteWeatherData, localCity.woeid))
        .thenReturn(localWeatherCompanionData);
    when(() => localDayWeatherMapper.map(remoteWeatherData, localCity.woeid))
        .thenReturn((localDayWeatherCompanionData));
    when(
      () => weatherLocalService.deleteCurrentAndAddNewWeatherData(
        woeid: localCity.woeid,
        weather: localWeatherCompanionData,
        weatherList: localDayWeatherCompanionData,
      ),
    ).thenAnswer((_) => Future.value());

    // When
    await weatherRepository.fetchWeatherForFavoriteCities();

    // Then
    verify(() => dateRepository.todayDate()).called(1);
    verify(() => weatherLocalService.getFavouriteCities()).called(1);
    verify(() => weatherLocalService.getLocalDayWeather(woeid: 1)).called(1);
    verify(() => dateRepository.mapDartDateTimeToDate(any())).called(1);
    verify(() => weatherRemoteService.weatherForCity(id: localCity.woeid))
        .called(1);
    verify(() => localWeatherMapper.map(remoteWeatherData, localCity.woeid))
        .called(1);
    verify(() => localDayWeatherMapper.map(remoteWeatherData, localCity.woeid))
        .called(1);
    verify(() => weatherLocalService.deleteCurrentAndAddNewWeatherData(
          woeid: localCity.woeid,
          weather: localWeatherCompanionData,
          weatherList: localDayWeatherCompanionData,
        )).called(1);
  });

  test(
      "Given weather list is not stale, When fetchWeatherForFavoriteCities is called, weather should not be fetch from remote",
      () async {
    // Given
    const date = Date(year: 1970, month: 1, day: 1);
    final localCityData = singleLocalCityDataList;
    final localCity = localCityData.first;
    const localWeatherCompanionData = localWeatherCompanion;
    final localDayWeatherCompanionData = localDayWeatherCompanionList;
    final localDayWeatherData = localDayWeatherList;
    when(() => dateRepository.todayDate()).thenReturn(date);
    when(() => weatherLocalService.getFavouriteCities())
        .thenAnswer((_) => Future.value(localCityData));
    when(() =>
            weatherLocalService.getLocalDayWeather(woeid: any(named: "woeid")))
        .thenAnswer((_) => Future.value(localDayWeatherData));
    when(() => dateRepository.mapDartDateTimeToDate(any())).thenReturn(date);

    // When
    await weatherRepository.fetchWeatherForFavoriteCities();

    // Then
    verify(() => dateRepository.todayDate()).called(1);
    verify(() => weatherLocalService.getFavouriteCities()).called(1);
    verify(() => weatherLocalService.getLocalDayWeather(woeid: 1)).called(1);
    verify(() => dateRepository.mapDartDateTimeToDate(any())).called(1);
    verifyZeroInteractions(weatherRemoteService);
    verifyZeroInteractions(localWeatherMapper);
    verifyZeroInteractions(localDayWeatherMapper);
    verifyNever(() => weatherLocalService.deleteCurrentAndAddNewWeatherData(
          woeid: localCity.woeid,
          weather: localWeatherCompanionData,
          weatherList: localDayWeatherCompanionData,
        ));
  });
}
