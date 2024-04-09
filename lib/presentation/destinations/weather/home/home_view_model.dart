import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/intent/intent_handler.dart';
import 'package:flutter_template/presentation/base/view_model_provider/base_view_model.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_screen.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_screen_state.dart';
import 'package:get_it/get_it.dart';

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeScreenState>(
        (ref) => GetIt.I.get());

abstract class HomeViewModel extends BaseViewModel<HomeScreen, HomeScreenState>
    implements IntentHandler<HomeScreenIntent> {
  HomeViewModel(super.state);
}
