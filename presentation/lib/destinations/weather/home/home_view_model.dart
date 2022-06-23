import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/base/intent/intent_handler.dart';
import 'package:presentation/base/view_model_provider/base_view_model.dart';
import 'package:presentation/destinations/weather/home/home_screen_intent.dart';
import 'package:presentation/destinations/weather/home/home_screen_state.dart';
import 'package:presentation_entity/presentation_entity.dart';

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeScreenState>((ref) => GetIt.I.get());

abstract class HomeViewModel extends BaseViewModel<HomeScreen, HomeScreenState>
    implements IntentHandler<HomeScreenIntent> {
  HomeViewModel(HomeScreenState state) : super(state);
}
