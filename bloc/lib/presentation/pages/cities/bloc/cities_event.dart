part of 'cities_bloc.dart';

@freezed
abstract class CitiesEvent with _$CitiesEvent {
  const factory CitiesEvent.searchCities(String searchTerm) = _SearchCities;
  const factory CitiesEvent.selectCity(KtList<City> loadedList, int selectedIndex) = _SelectCity;
}