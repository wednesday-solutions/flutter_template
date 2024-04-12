import 'package:faker/faker.dart';
import 'package:flutter_template/services/entity/open_weather/current_weather/remote/remote_current_weather.dart';
import 'package:flutter_template/services/entity/open_weather/current_weather/remote/remote_current_weather_clouds.dart';
import 'package:flutter_template/services/entity/open_weather/current_weather/remote/remote_current_weather_coord.dart';
import 'package:flutter_template/services/entity/open_weather/current_weather/remote/remote_current_weather_main.dart';
import 'package:flutter_template/services/entity/open_weather/current_weather/remote/remote_current_weather_sys.dart';
import 'package:flutter_template/services/entity/open_weather/current_weather/remote/remote_current_weather_weather.dart';
import 'package:flutter_template/services/entity/open_weather/current_weather/remote/remote_current_weather_wind.dart';
import 'package:flutter_template/services/entity/open_weather/geo_coding/remote/remote_location.dart';
import 'package:flutter_template/services/weather/remote/weather_remote_service.dart';

class FakeWeatherRemoteService implements WeatherRemoteService {
  @override
  Future<RemoteCurrentWeather> currentWeather(
      {required String cityAndState}) async {
    await Future.delayed(const Duration(seconds: 1));
    return RemoteCurrentWeather(
      coord: RemoteCurrentWeatherCoord(
        lat: faker.randomGenerator.decimal(),
        lon: faker.randomGenerator.decimal(),
      ),
      weather: [
        RemoteCurrentWeatherWeather(
          id: faker.randomGenerator.integer(10000),
          main: faker.randomGenerator.string(10),
          description: faker.lorem.sentence(),
          icon: "01d",
        ),
      ],
      base: faker.randomGenerator.string(10),
      main: RemoteCurrentWeatherMain(
        temp: faker.randomGenerator.decimal(scale: 100),
        feelsLike: faker.randomGenerator.decimal(scale: 100),
        tempMin: faker.randomGenerator.decimal(scale: 100),
        tempMax: faker.randomGenerator.decimal(scale: 100),
        pressure: faker.randomGenerator.integer(100),
        humidity: faker.randomGenerator.integer(100),
      ),
      visibility: faker.randomGenerator.integer(100),
      wind: RemoteCurrentWeatherWind(
        speed: faker.randomGenerator.decimal(),
        deg: faker.randomGenerator.integer(360),
      ),
      clouds:
          RemoteCurrentWeatherClouds(all: faker.randomGenerator.integer(100)),
      dt: faker.randomGenerator.integer(100),
      sys: RemoteCurrentWeatherSys(
        country: faker.address.country(),
        sunrise: faker.date.dateTime().millisecondsSinceEpoch,
        sunset: faker.date.dateTime().millisecondsSinceEpoch,
      ),
      timezone: faker.randomGenerator.integer(50),
      id: faker.randomGenerator.integer(10000),
      name: faker.address.city(),
      cod: faker.randomGenerator.integer(50),
    );
  }

  @override
  Future<List<RemoteLocation>> geocodingSearch(
      {required String searchTerm}) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      RemoteLocation(
        country: "India",
        lat: 109.23,
        lon: -10.43,
        name: "Pune",
      ),
      RemoteLocation(
        country: "India",
        lat: 19.93,
        lon: 100.13,
        name: "Mumbai",
      ),
      ...List.generate(
        5,
        (index) => RemoteLocation(
          country: faker.address.country(),
          lat: faker.randomGenerator.decimal(scale: 100),
          lon: faker.randomGenerator.decimal(scale: 100),
          name: faker.address.city(),
        ),
      )
    ];
  }
}
