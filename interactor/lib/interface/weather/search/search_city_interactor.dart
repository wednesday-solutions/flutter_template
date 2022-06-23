import 'package:presentation_entity/presentation_entity.dart';

abstract class SearchCityInteractor {
  Stream<List<UIListItem>> get searchResultsStream;

  Future<void> search(String term);
}
