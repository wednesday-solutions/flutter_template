import 'dart:async';

import 'package:domain/domain.dart';
import 'package:domain_entity/domain_entity.dart';
import 'package:foundation/foundation.dart';
import 'package:interactor/interface/weather/search/search_city_interactor.dart';
import 'package:interactor/src/weather/search/city_search_result_mapper.dart';
import 'package:presentation_entity/presentation_entity.dart';
import 'package:rxdart/rxdart.dart';

class SearchCityInteractorImpl extends SearchCityInteractor {
  final SearchCitiesUseCase searchCitiesUseCase;
  final GetFavoriteCitiesStreamUseCase favoriteCitiesStreamUseCase;
  final CitySearchResultMapper citySearchResultMapper;
  final StreamController<List<City>> _searchResultsStreamController =
      StreamController();

  SearchCityInteractorImpl({
    required this.searchCitiesUseCase,
    required this.favoriteCitiesStreamUseCase,
    required this.citySearchResultMapper,
  });

  @override
  Stream<List<UIListItem>> get searchResultsStream =>
      CombineLatestStream.combine2<List<City>, List<City>, List<UIListItem>>(
        favoriteCitiesStreamUseCase(unit),
        _searchResultsStreamController.stream,
        (favoriteCities, searchResults) {
          return citySearchResultMapper.map(
            favoriteCities,
            searchResults,
          );
        },
      ).doOnData((event) {
        logD("searchResultsStream: emit = $event");
      });

  @override
  Future<void> search(String term) async {
    logD("search: term = $term");
    final searchResults = await searchCitiesUseCase(param: term);
    searchResults.when(
      success: (data) => _searchResultsStreamController.sink.add(data),
      error: (e) => log.e(
          "SearchCityInteractorImpl: search for $term returned error ${e?.toString()}"),
    );
  }
}
