import 'package:flutter_template/core/entity/result.dart';
import 'package:flutter_template/domain/weather/set_city_favorite_use_case_impl.dart';
import 'package:flutter_template/repository/weather/weather_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../exception/test_exceptions.dart';
import '../../extensions/mock_extensions.dart';
import '../../mocks/mocks.dart';
import '../../test_models/city_models.dart';

void main() {
  late WeatherRepository weatherRepository;
  late SetCityFavoriteUseCaseImpl setCityFavoriteUseCase;

  setUp(() {
    weatherRepository = MockWeatherRepository();
    setCityFavoriteUseCase = SetCityFavoriteUseCaseImpl(
      weatherRepository: weatherRepository,
    );
  });

  tearDown(() {
    resetMocktailState();
  });

  test(
    "Given set city favorite use case is called, When no error occurs, Then Result.success is returned",
    () async {
      // Given
      final testCity = city1;
      when(() => weatherRepository.setCityAsFavorite(testCity)).justRun();

      // When
      final result = await setCityFavoriteUseCase(param: testCity);

      // Then
      expect(result, isA<Success>());
      verify(() => weatherRepository.setCityAsFavorite(testCity)).called(1);
    },
  );

  test(
    "Given set city favorite use case is called, When error occurs, Then Result.failure is returned",
    () async {
      // Given
      final testCity = city1;
      final testException = TestException();
      when(() => weatherRepository.setCityAsFavorite(testCity))
          .thenThrow(testException);

      // When
      final result = await setCityFavoriteUseCase(param: testCity);

      // Then
      expect(result, isA<Error>());
      expect((result as Error).exception, same(testException));
      verify(() => weatherRepository.setCityAsFavorite(testCity)).called(1);
    },
  );
}
