import 'package:flutter_template_bloc/data/datasource/local/weather_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../mocks/city_mock.dart';

void main() {
  group('City Dao', () {
    WeatherDatabase weatherDatabase;

    setUp(() async {
      weatherDatabase = WeatherDatabase(VmDatabase.memory());
      await weatherDatabase.cityDao.insertCity(mockCity1);
    });

    tearDown(() async {
      await weatherDatabase.close();
    });

    test('inserts a city into the database', () async {
      await weatherDatabase.cityDao.insertCity(mockCity2);
      final cities = await weatherDatabase.cityDao.getAllCities();

      expect(cities, [mockCity1, mockCity2]);
    });

    test('watches all cities in database', () async {
      final expectation = expectLater(
        weatherDatabase.cityDao.watchAllCities(),
        emitsInOrder([
          [mockCity1],
          [mockCity1, mockCity2],
        ]),
      );

      await weatherDatabase.cityDao.insertCity(mockCity2);
      await expectation;
    });

    test('fetches all cities', () async {
      final cities = await weatherDatabase.cityDao.getAllCities();

      expect(cities, [mockCity1]);
    });

    test('fetches all ids', () async {
      await weatherDatabase.cityDao.insertCity(mockCity2);
      final ids = await weatherDatabase.cityDao.getAllIds();

      expect(ids, [1, 2]);
    });

    test('does not insert city with duplicate id', () async {
      expect(
          () => weatherDatabase.cityDao.insertCity(mockCity1), throwsException);
    });
  });
}
