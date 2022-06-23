import 'package:interactor/interactor.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/base/intent/intent_handler.dart';
import 'package:presentation/navigation/weather/search/search_navigator.dart';
import 'package:presentation_entity/presentation_entity.dart';

class MockFavoriteWeatherInteractor extends Mock implements FavoriteWeatherInteractor {}

class MockSearchCityInteractor extends Mock implements SearchCityInteractor {}

// Navigator
class MockSearchNavigator extends Mock implements SearchNavigator {}

// Intent Handler
class MockIntentHandler<T extends BaseIntent> extends Mock implements IntentHandler<T> {}
