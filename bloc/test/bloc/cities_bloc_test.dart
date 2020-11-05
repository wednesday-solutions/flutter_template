import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_template_bloc/core/failures/city_failure.dart';
import 'package:flutter_template_bloc/presentation/pages/cities/bloc/cities_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/collection.dart';
import 'package:mockito/mockito.dart';

import '../mocks/city_mock.dart';
import '../mocks/weather_repository_mock.dart';

void main() {
  group('Cities Bloc', () {
    CitiesBloc citiesBloc;
    MockWeatherRepository mockWeatherRepository;

    setUp(() {
      mockWeatherRepository = MockWeatherRepository();
      when(mockWeatherRepository.getSelectedCityIds())
          .thenAnswer((realInvocation) async => const KtList.empty());
      citiesBloc = CitiesBloc(mockWeatherRepository);
    });

    test('contains initial state by default', () {
      expect(citiesBloc.state, const CitiesState.initial());
    });

    blocTest<CitiesBloc, CitiesState>(
        'searches for city string and returns loaded state with list of cities',
        build: () {
          mockWeatherRepository.mockSearchCitiesResponse(
              'Mumbai', KtList.of(mockCity1));
          return citiesBloc;
        },
        act: (bloc) {
          bloc.add(const CitiesEvent.searchCities('Mumbai'));
        },
        wait: const Duration(milliseconds: 500),
        verify: (bloc) {
          verify(mockWeatherRepository.searchCities(searchTerm: 'Mumbai'))
              .called(1);
        },
        expect: [
          const CitiesState.loading(),
          CitiesState.loaded(KtList.of(mockCity1))
        ]);

    blocTest<CitiesBloc, CitiesState>(
        'searches for city string and returns failure state when an error occurs',
        build: () {
          mockWeatherRepository.mockSearchCitiesFailureResponse(
            'Mumbai',
            const CityFailure.requestTimeOut(message: 'Test Message'),
          );
          return citiesBloc;
        },
        act: (bloc) {
          bloc.add(const CitiesEvent.searchCities('Mumbai'));
        },
        wait: const Duration(milliseconds: 500),
        verify: (bloc) {
          verify(mockWeatherRepository.searchCities(searchTerm: 'Mumbai'))
              .called(1);
        },
        expect: [
          const CitiesState.loading(),
          const CitiesState.failure(
              CityFailure.requestTimeOut(message: 'Test Message'))
        ]);

    blocTest<CitiesBloc, CitiesState>('debounces searchCity events for 500ms',
        build: () {
          mockWeatherRepository.mockSearchCitiesResponse(
              'Mumbai', KtList.of(mockCity1));
          return citiesBloc;
        },
        act: (bloc) async {
          bloc.add(const CitiesEvent.searchCities('M'));
          await Future.delayed(const Duration(milliseconds: 10));
          bloc.add(const CitiesEvent.searchCities('Mu'));
          await Future.delayed(const Duration(milliseconds: 10));
          bloc.add(const CitiesEvent.searchCities('Mum'));
          await Future.delayed(const Duration(milliseconds: 10));
          bloc.add(const CitiesEvent.searchCities('Mumbai'));
        },
        wait: const Duration(milliseconds: 500),
        verify: (bloc) {
          verify(mockWeatherRepository.searchCities(searchTerm: 'Mumbai'))
              .called(1);
        },
        expect: [
          const CitiesState.loading(),
          CitiesState.loaded(KtList.of(mockCity1))
        ]);

    blocTest<CitiesBloc, CitiesState>(
        'selects a city without debouncing selectCity event',
        build: () {
          mockWeatherRepository.mockSearchCitiesResponse(
              'Mumbai', KtList.of(mockCity1));
          return citiesBloc;
        },
        act: (bloc) async {
          await Future.delayed(const Duration(milliseconds: 10));
          bloc.add(CitiesEvent.selectCity(KtList.of(mockCity1), 0));
          await Future.delayed(const Duration(milliseconds: 10));
          bloc.add(CitiesEvent.selectCity(KtList.of(mockCity2), 0));
          await Future.delayed(const Duration(milliseconds: 10));
          bloc.add(CitiesEvent.selectCity(KtList.of(mockCity1), 0));
        },
        wait: const Duration(milliseconds: 1),
        verify: (bloc) {
          verify(mockWeatherRepository.selectCity(mockCity1)).called(2);
          verify(mockWeatherRepository.selectCity(mockCity2)).called(1);
        },
        expect: [
          CitiesState.loaded(KtList.of(mockCity1.copyWith(isSelected: true))),
          CitiesState.loaded(KtList.of(mockCity2.copyWith(isSelected: true))),
          CitiesState.loaded(KtList.of(mockCity1.copyWith(isSelected: true)))
        ]);
  });
}
