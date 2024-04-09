import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/intent/intent_handler.dart';
import 'package:flutter_template/presentation/base/view_model_provider/base_view_model.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/weather/search/search_screen_state.dart';
import 'package:get_it/get_it.dart';

final searchViewModelProvider =
    StateNotifierProvider.autoDispose<SearchViewModel, SearchScreenState>(
        (ref) => GetIt.I.get());

abstract class SearchViewModel
    extends BaseViewModel<SearchScreen, SearchScreenState>
    implements IntentHandler<SearchScreenIntent> {
  SearchViewModel(super.state);

  String get searchTerm;
}
