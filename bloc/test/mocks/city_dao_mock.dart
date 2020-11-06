import 'package:flutter_template_bloc/data/datasource/local/dao/city_dao_interface.dart';
import 'package:flutter_template_bloc/data/model/city.dart';
import 'package:mockito/mockito.dart';
import 'package:moor_flutter/moor_flutter.dart';

class MockCityDao extends Mock implements ICityDao {
  void mockGetAllCities(List<City> citiesList) {
    when(getAllCities()).thenAnswer((realInvocation) async => citiesList);
  }

  void mockGetAllCitiesException({String message = 'Test Failure'}) {
    when(getAllCities()).thenThrow(MoorWrappedException(message: message));
  }

  void mockWatchAllCities(Stream<List<City>> stream) {
    when(watchAllCities()).thenAnswer((realInvocation) => stream);
  }

  void mockInsertCity(City city) {
    when(insertCity(city)).thenAnswer((realInvocation) async {
      return;
    });
  }

  void mockGetAllIds(List<int> idList) {
    when(getAllIds()).thenAnswer((realInvocation) async => idList);
  }
}
