import 'package:base_test/exception/test_exceptions.dart';
import 'package:base_test/extensions/stream_extensions.dart';
import 'package:domain/domain.dart';
import 'package:domain/src/weather/get_favorite_cities_stream_use_case_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foundation/foundation.dart';
import 'package:mocktail/mocktail.dart';
import 'package:repository/repository.dart';

import '../mocks/mocks.dart';
import '../models/city_models.dart';

void main() {
  late WeatherRepository weatherRepository;
  late GetFavoriteCitiesStreamUseCase getFavoriteCitiesStreamUseCase;

  setUp(() {
    weatherRepository = MockWeatherRepository();
    getFavoriteCitiesStreamUseCase =
        GetFavoriteCitiesStreamUseCaseImpl(weatherRepository: weatherRepository);
  });

  tearDown(() {
    resetMocktailState();
  });

  test(
    "Given get favorite cities stream use case called, When no error occurs, Then correct data is emitted",
    () {
      // Given
      final testCityList = singleCityList;
      when(() => weatherRepository.getFavoriteCitiesStream())
          .thenAnswer((invocation) => Stream.value(testCityList));

      // When
      expect(
        getFavoriteCitiesStreamUseCase(unit),
        // Then
        emitsInOrder([testCityList]),
      );
    },
  );

  test(
    "Given get favorite cities stream use case called, When error occurs, Then no data is emitted",
    () {
      // Given
      final testException = TestException();
      when(() => weatherRepository.getFavoriteCitiesStream())
          .thenAnswer((invocation) => Stream.error(testException));

      // When
      getFavoriteCitiesStreamUseCase(unit)
          // Then
          .emitsNothing;
    },
  );
}
