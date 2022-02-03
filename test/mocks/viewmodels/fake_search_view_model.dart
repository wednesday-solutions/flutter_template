import 'package:flutter_template/presentation/weather/search/search_screen_intent.dart';
import 'package:flutter_template/presentation/weather/search/search_screen_state.dart';
import 'package:flutter_template/presentation/weather/search/search_view_model.dart';

class FakeSearchViewModel extends SearchViewModel {
  FakeSearchViewModel(SearchScreenState state) : super(state);

  @override
  onInit() {

  }

  @override
  void onIntent(SearchScreenIntent intent) {

  }

  String _searchTerm = "";

  @override
  String get searchTerm => _searchTerm;

  updateSearchTerm(String newTerm) {
    _searchTerm = newTerm;
  }
}
