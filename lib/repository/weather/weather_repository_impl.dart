import 'package:flutter_template/domain/entity/weather/city.dart';
import 'package:flutter_template/domain/entity/weather/weather.dart';
import 'package:flutter_template/repository/date/date_repository.dart';
import 'package:flutter_template/repository/weather/domain_city_mapper.dart';
import 'package:flutter_template/repository/weather/domain_weather_mapper.dart';
import 'package:flutter_template/repository/weather/local_day_weather_mapper.dart';
import 'package:flutter_template/repository/weather/local_weather_mapper.dart';
import 'package:flutter_template/repository/weather/weather_repository.dart';
import 'package:flutter_template/services/base/database/app_database.dart';
import 'package:flutter_template/services/weather/local/weather_local_service.dart';
import 'package:flutter_template/services/weather/remote/weather_remote_service.dart';
import 'package:flutter_template/repository/weather/local_city_mapper.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherLocalService weatherLocalService;
  final WeatherRemoteService weatherRemoteService;
  final DomainCityMapper domainCityMapper;
  final DomainWeatherMapper domainWeatherMapper;
  final LocalCityMapper localCityMapper;
  final LocalWeatherMapper localWeatherMapper;
  final LocalDayWeatherMapper localDayWeatherMapper;
  final DateRepository dateRepository;

  WeatherRepositoryImpl({
    required this.weatherLocalService,
    required this.weatherRemoteService,
    required this.domainCityMapper,
    required this.domainWeatherMapper,
    required this.localCityMapper,
    required this.localWeatherMapper,
    required this.localDayWeatherMapper,
    required this.dateRepository,
  });

  @override
  Future<void> fetchWeatherForFavoriteCities() async {
    final todayDate = dateRepository.todayDate();
    final favoriteCities = await weatherLocalService.getFavouriteCities();

    await Future.forEach(
      favoriteCities,
      (LocalCityData cityData) async {
        final dayWeatherList =
            await weatherLocalService.getLocalDayWeather(woeid: cityData.woeid);
        final isWeatherListStale = !dayWeatherList.any(
          (weatherData) =>
              dateRepository.mapDartDateTimeToDate(weatherData.date) ==
              todayDate,
        );

        if (dayWeatherList.isEmpty || isWeatherListStale) {
          final remoteWeather =
              await weatherRemoteService.weatherForCity(id: cityData.woeid);

          await weatherLocalService.deleteCurrentAndAddNewWeatherData(
            woeid: cityData.woeid,
            weather: localWeatherMapper.map(remoteWeather, cityData.woeid),
            weatherList:
                localDayWeatherMapper.map(remoteWeather, cityData.woeid),
          );
        }
      },
    );
  }

  @override
  Stream<List<City>> getFavoriteCitiesStream() {
    return weatherLocalService.getFavoriteCitiesStream().map(
          (localCityDataList) => domainCityMapper.mapList(localCityDataList),
        );
  }

  @override
  Future<List<City>> getFavoriteCitiesList() async {
    final localCityDataList = await weatherLocalService.getFavouriteCities();
    return domainCityMapper.mapList(localCityDataList);
  }

  @override
  Stream<List<Weather>> getFavoriteCitiesWeatherStream() {
    return weatherLocalService.getFavoriteCitiesWeatherStream().map(
      (cityWithWeatherList) {
        return domainWeatherMapper.mapList(cityWithWeatherList);
      },
    );
  }

  @override
  Future<List<Weather>> getFavoriteCitiesWeatherList() async {
    final cityWithWeatherList =
        await weatherLocalService.getFavoriteCitiesWeatherList();
    return domainWeatherMapper.mapList(cityWithWeatherList);
  }

  @override
  Future<void> removeCityAsFavorite(City city) async {
    await weatherLocalService.deleteFavoriteCity(
      city: localCityMapper.map(city),
    );
  }

  @override
  Future<List<City>> searchCities(String searchTerm) async {
    final results = await weatherRemoteService.searchCities(
      searchTerm: searchTerm,
    );
    return domainCityMapper.mapRemoteCityList(results);
  }

  @override
  Future<void> setCityAsFavorite(City city) async {
    await weatherLocalService.markCityAsFavorite(
      city: localCityMapper.map(city),
    );
  }
}
