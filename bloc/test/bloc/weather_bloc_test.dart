import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_template_bloc/core/failures/weather_failure.dart';
import 'package:flutter_template_bloc/presentation/pages/weather/bloc/weather_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/collection.dart';
import 'package:mockito/mockito.dart';

import '../mocks/weather_mock.dart';
import '../mocks/weather_repository_mock.dart';

void main() {
  group(
    'Weather Bloc',
    () {
      WeatherBloc weatherBloc;
      MockWeatherRepository mockWeatherRepository;

      setUp(() {
        mockWeatherRepository = MockWeatherRepository();
        weatherBloc = WeatherBloc(mockWeatherRepository);
      });

      test('contains initial state by default', () {
        expect(weatherBloc.state, const WeatherState.initial());
      });

      blocTest<WeatherBloc, WeatherState>(
        'watches weather for all cities',
        build: () {
          mockWeatherRepository.mockEmptyWatchWeatherResponse();
          return weatherBloc;
        },
        act: (bloc) => bloc.add(const WeatherEvent.watchWeatherForAllCities()),
        verify: (bloc) =>
            verify(mockWeatherRepository.watchWeatherForAllCities()).called(1),
      );

      blocTest<WeatherBloc, WeatherState>(
          'returns weather loaded state with weather data on successful weather load',
          build: () {
            mockWeatherRepository
                .mockWatchWeatherResponse(KtList.of(mockWeather1));
            return weatherBloc;
          },
          act: (bloc) => bloc.add(const WeatherEvent.watchWeatherForAllCities()),
          expect: [
            const WeatherState.loading(),
            WeatherState.loaded(KtList.of(mockWeather1))
          ]);

      blocTest<WeatherBloc, WeatherState>(
        'returns noCitiesSelected state when no cities are selected',
        build: () {
          mockWeatherRepository.mockEmptyWatchWeatherResponse();
          return weatherBloc;
        },
        act: (bloc) => bloc.add(const WeatherEvent.watchWeatherForAllCities()),
        expect: [
          const WeatherState.loading(),
          const WeatherState.noCitiesSelected()
        ],
      );

      blocTest<WeatherBloc, WeatherState>(
        'returns failure state when an error occurs',
        build: () {
          mockWeatherRepository
              .mockWatchWeatherFailureResponse(const WeatherFailure.unableToFetch(message: 'Test error'));
          return weatherBloc;
        },
        act: (bloc) => bloc.add(const WeatherEvent.watchWeatherForAllCities()),
        expect: [
          const WeatherState.loading(),
          const WeatherState.failure(WeatherFailure.unableToFetch(message: 'Test error'))
        ],
      );
    },
  );
}
