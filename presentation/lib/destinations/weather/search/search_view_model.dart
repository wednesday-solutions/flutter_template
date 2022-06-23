import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/base/intent/intent_handler.dart';
import 'package:presentation/base/view_model_provider/base_view_model.dart';
import 'package:presentation/destinations/weather/search/search_screen_intent.dart';
import 'package:presentation/destinations/weather/search/search_screen_state.dart';
import 'package:presentation_entity/presentation_entity.dart';

final searchViewModelProvider =
    StateNotifierProvider.autoDispose<SearchViewModel, SearchScreenState>(
        (ref) => GetIt.I.get());

abstract class SearchViewModel
    extends BaseViewModel<SearchScreen, SearchScreenState>
    implements IntentHandler<SearchScreenIntent> {
  SearchViewModel(SearchScreenState state) : super(state);

  String get searchTerm;
}
