import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_template_bloc/core/failures/city_failure.dart';
import 'package:flutter_template_bloc/data/model/city.dart';
import 'package:flutter_template_bloc/data/repository/weather_repository_interface.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:rxdart/rxdart.dart';

part 'cities_event.dart';
part 'cities_state.dart';
part 'cities_bloc.freezed.dart';

@Injectable()
class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  final IWeatherRepository weatherRepository;

  CitiesBloc(this.weatherRepository) : super(const CitiesState.initial());

  StreamSubscription<Either<CityFailure, KtList<City>>>
      _selectedCitiesStreamSubscription;

  @override
  Stream<Transition<CitiesEvent, CitiesState>> transformEvents(
      events, transitionFn) {
    return events
        .debounce((event) => TimerStream(event, Duration(milliseconds: event is _SearchCities ? 500 : 0)))
        .switchMap(transitionFn);
  }

  @override
  Stream<CitiesState> mapEventToState(
    CitiesEvent event,
  ) async* {
    yield* event.map(
      searchCities: _handleSearchCities,
      selectCity: _handleSelectCity,
    );
  }

  Stream<CitiesState> _handleSearchCities(_SearchCities event) async* {
    yield const CitiesState.loading();
    if (event.searchTerm.isEmpty) {
      yield const CitiesState.initial();
    } else {
      final Either<CityFailure, KtList<City>> citiesResult =
          await weatherRepository.searchCities(searchTerm: event.searchTerm);
      final KtList<int> selectedIds = await weatherRepository.getSelectedCityIds();
      yield citiesResult.fold(
        (failure) => CitiesState.failure(failure),
        (citiesList) {
          return CitiesState.loaded(citiesList.mapIndexed((index, city) {
            if (selectedIds.contains(city.woeid)) {
              return city.copyWith(isSelected: true);
            }
            return city;
          }));
        },
      );
    }
  }

  Stream<CitiesState>  _handleSelectCity(_SelectCity event) async* {
    yield CitiesState.loaded(event.loadedList.mapIndexed((index, city) {
      if (index == event.selectedIndex && !city.isSelected) {
        weatherRepository.selectCity(city);
        return city.copyWith(isSelected: true);
      }
      return city;
    }));
  }

  @override
  Future<void> close() async {
    await _selectedCitiesStreamSubscription?.cancel();
    return super.close();
  }
}
