import 'package:flutter_template/domain/entity/weather/city.dart';
import 'package:flutter_template/domain/entity/weather/weather.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';
import 'package:flutter_template/repository/date/date_repository.dart';
import 'package:flutter_template/repository/weather/domain_city_mapper.dart';
import 'package:flutter_template/repository/weather/domain_weather_mapper.dart';
import 'package:flutter_template/repository/weather/local_city_mapper.dart';
import 'package:flutter_template/repository/weather/local_weather_mapper.dart';
import 'package:flutter_template/repository/weather/weather_repository.dart';
import 'package:flutter_template/services/weather/local/weather_local_service.dart';
import 'package:flutter_template/services/weather/remote/weather_remote_service.dart';
import 'package:rxdart/rxdart.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherLocalService weatherLocalService;
  final WeatherRemoteService weatherRemoteService;
  final DomainCityMapper domainCityMapper;
  final DomainWeatherMapper domainWeatherMapper;
  final LocalCityMapper localCityMapper;
  final LocalWeatherMapper localWeatherMapper;
  final DateRepository dateRepository;

  WeatherRepositoryImpl({
    required this.weatherLocalService,
    required this.weatherRemoteService,
    required this.domainCityMapper,
    required this.domainWeatherMapper,
    required this.localCityMapper,
    required this.localWeatherMapper,
    required this.dateRepository,
  });

  @override
  Future<void> fetchWeatherForFavoriteCities() async {
    logD("fetchWeatherForFavoriteCities");
    final nowMillis =
        dateRepository.convertDateTimeToMillis(dateRepository.nowDateTime());
    const twoHours = 2 * 60 * 60 * 1000;

    final favoriteCities = await weatherLocalService.getFavouriteCities();
    for (final city in favoriteCities) {
      final localCurrentWeather =
          await weatherLocalService.getLocalCurrentWeather(
        lat: city.lat,
        lon: city.lon,
      );
      final isWeatherDataStale = localCurrentWeather != null &&
          (nowMillis -
                  localCurrentWeather.updatedAt.millisecondsSinceEpoch.abs()) >
              twoHours;

      if (localCurrentWeather == null || isWeatherDataStale) {
        final searchQuery =
            city.name + (city.state != null ? ", ${city.state}" : "");

        final remoteCurrentWeather = await weatherRemoteService.currentWeather(
          cityAndState: searchQuery,
        );

        await weatherLocalService.upsertLocalCurrentWeather(
          weather: localWeatherMapper.map(
            remoteCurrentWeather,
            city.lat,
            city.lon,
          ),
        );
      }
    }
  }

  @override
  Stream<List<City>> getFavoriteCitiesStream() {
    logD("getFavoriteCitiesStream");
    return weatherLocalService.getFavoriteCitiesStream().map(
          (localCityDataList) => domainCityMapper.mapList(localCityDataList),
        );
  }

  @override
  Future<List<City>> getFavoriteCitiesList() async {
    logD("getFavoriteCitiesList");
    final localCityDataList = await weatherLocalService.getFavouriteCities();
    return domainCityMapper.mapList(localCityDataList);
  }

  @override
  Stream<List<Weather>> getFavoriteCitiesWeatherStream() {
    logD("getFavoriteCitiesWeatherStream");
    return weatherLocalService
        .getFavoriteCitiesWeatherStream()
        .doOnData(
            (data) => logD("getFavoriteCitiesWeatherStream: onEmit: $data"))
        .map(
      (cityWithWeatherList) {
        return domainWeatherMapper.mapList(cityWithWeatherList);
      },
    );
  }

  @override
  Future<List<Weather>> getFavoriteCitiesWeatherList() async {
    logD("getFavoriteCitiesWeatherList");
    final cityWithWeatherList =
        await weatherLocalService.getFavoriteCitiesWeatherList();
    return domainWeatherMapper.mapList(cityWithWeatherList);
  }

  @override
  Future<void> removeCityAsFavorite(City city) async {
    logD("removeCityAsFavorite: city = $city");
    await weatherLocalService.deleteFavoriteCity(
      city: localCityMapper.map(city),
    );
    await weatherLocalService.deleteLocalCurrentWeather(
        lat: city.lat, lon: city.lon);
  }

  @override
  Future<List<City>> searchCities(String searchTerm) async {
    logD("searchCities: searchTerm = $searchTerm");
    final results = await weatherRemoteService.geocodingSearch(
      searchTerm: searchTerm,
    );
    return domainCityMapper.mapRemoteCityList(results);
  }

  @override
  Future<void> setCityAsFavorite(City city) async {
    logD("setCityAsFavorite: city = $city");
    await weatherLocalService.markCityAsFavorite(
      city: localCityMapper.map(city),
    );
  }
}
