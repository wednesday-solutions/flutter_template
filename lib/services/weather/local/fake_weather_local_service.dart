import 'package:faker/faker.dart';
import 'package:flutter_template/foundation/extensions/object_ext.dart';
import 'package:flutter_template/services/base/database/app_database.dart';
import 'package:flutter_template/services/weather/local/weather_local_service.dart';
import 'package:rxdart/rxdart.dart';

class FakeWeatherLocalService implements WeatherLocalService {
  @override
  Future<void> deleteFavoriteCity(
      {required LocalLocationCompanion city}) async {
    return;
  }

  @override
  Future deleteLocalCurrentWeather(
      {required double lat, required double lon}) async {
    return;
  }

  @override
  Stream<List<LocalLocationData>> getFavoriteCitiesStream() {
    return Stream.value(
      List.generate(
        10,
        (index) => LocalLocationData(
          country: faker.address.country(),
          lat: faker.randomGenerator.decimal(scale: 100),
          lon: faker.randomGenerator.decimal(scale: 100),
          name: faker.address.city(),
        ),
      ),
    );
  }

  @override
  Future<List<LocalCurrentWeatherData>> getFavoriteCitiesWeatherList() async {
    return List.generate(10, (index) => _localCurrentWeatherData());
  }

  @override
  Stream<List<LocalCurrentWeatherData>> getFavoriteCitiesWeatherStream() {
    return Stream.value(
      List.generate(10, (index) => _localCurrentWeatherData()),
    ).doOnData((data) => logD("getFavoriteCitiesWeatherStream: emit: $data"));
  }

  @override
  Future<List<LocalLocationData>> getFavouriteCities() async {
    return List.generate(
      10,
      (index) => LocalLocationData(
        country: faker.address.country(),
        lat: faker.randomGenerator.decimal(scale: 100),
        lon: faker.randomGenerator.decimal(scale: 100),
        name: faker.address.city(),
      ),
    );
  }

  @override
  Future<LocalCurrentWeatherData?> getLocalCurrentWeather(
      {required double lat, required double lon}) async {
    return _localCurrentWeatherData();
  }

  @override
  Future<void> markCityAsFavorite(
      {required LocalLocationCompanion city}) async {
    return;
  }

  @override
  Future<void> upsertLocalCurrentWeather(
      {required LocalCurrentWeatherCompanion weather}) async {
    return;
  }

  LocalCurrentWeatherData _localCurrentWeatherData() => LocalCurrentWeatherData(
        base: faker.randomGenerator.string(4),
        cloudsAll: faker.randomGenerator.integer(10),
        cod: faker.randomGenerator.integer(999),
        coordLat: faker.randomGenerator.decimal(scale: 100),
        coordLon: faker.randomGenerator.decimal(scale: 100),
        dt: faker.randomGenerator.integer(100),
        id: faker.randomGenerator.integer(10000),
        mainFeelsLike: faker.randomGenerator.decimal(scale: 100),
        mainTemp: faker.randomGenerator.decimal(scale: 100),
        mainTempMin: faker.randomGenerator.decimal(scale: 100),
        mainTempMax: faker.randomGenerator.decimal(scale: 100),
        mainHumidity: faker.randomGenerator.integer(100),
        mainPressure: faker.randomGenerator.integer(100),
        name: faker.address.city(),
        sysCountry: faker.address.country(),
        sysSunrise: faker.date.dateTime().millisecondsSinceEpoch,
        sysSunset: faker.date.dateTime().millisecondsSinceEpoch,
        timezone: faker.randomGenerator.integer(100),
        visibility: faker.randomGenerator.integer(100),
        weatherId: faker.randomGenerator.integer(10000),
        weatherDescription: faker.lorem.sentence(),
        weatherIcon: "0${faker.randomGenerator.integer(5, min: 1)}d",
        weatherMain: faker.randomGenerator.string(10),
        windDeg: faker.randomGenerator.integer(360),
        windSpeed: faker.randomGenerator.decimal(scale: 10),
        updatedAt: faker.date.dateTime(),
      );
}
