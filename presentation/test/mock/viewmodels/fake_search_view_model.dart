import 'package:mocktail/mocktail.dart';
import 'package:presentation/destinations/weather/search/search_screen_state.dart';
import 'package:presentation/destinations/weather/search/search_view_model.dart';

class FakeSearchViewModel extends SearchViewModel with Mock {
  FakeSearchViewModel(SearchScreenState state) : super(state);

  String _searchTerm = "";

  @override
  String get searchTerm => _searchTerm;

  updateSearchTerm(String newTerm) {
    _searchTerm = newTerm;
  }
}
