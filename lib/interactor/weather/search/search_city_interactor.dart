import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';

abstract interface class SearchCityInteractor {
  Stream<List<UIListItem>> get searchResultsStream;

  Future<void> search(String term);
}
