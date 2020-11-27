part of 'cities_bloc.dart';

@freezed
abstract class CitiesState with _$CitiesState {
  const factory CitiesState.initial() = Initial;
  const factory CitiesState.loading() = Loading;
  const factory CitiesState.selectingCity(City city) = SelectingCity;
  const factory CitiesState.loaded(KtList<City> cityList) = Loaded;
  const factory CitiesState.selectedLoaded(KtList<City> selectedList) = SelectedLoaded;
  const factory CitiesState.failure(CityFailure failure) = Failure;
}
