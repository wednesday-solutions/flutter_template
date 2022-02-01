import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/widgets/list/ui_list.dart';
import 'package:flutter_template/presentation/base/widgets/page/base_page.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/entity/weather/ui_weather.dart';
import 'package:flutter_template/presentation/intl/strings.dart';
import 'package:flutter_template/presentation/weather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/weather/home/home_screen_state.dart';
import 'package:flutter_template/presentation/weather/home/home_view_model.dart';
import 'package:flutter_template/presentation/weather/home/list/ui_weather_renderer.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage<HomeScreen, HomeScreenState, HomeViewModel>(
      viewModelProvider: homeViewModelProvider,
      appBarActions: () => [
        IconButton(
            onPressed: () {
              final viewModel = ref.watch(homeViewModelProvider.notifier);
              viewModel.onIntent(HomeScreenIntent.search());
            },
            icon: const Icon(Icons.search))
      ],
      body: const _HomePageBody(),
    );
  }
}

class _HomePageBody extends ConsumerWidget {
  const _HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.watch(homeViewModelProvider.notifier);
    final weatherList =
        ref.watch(homeViewModelProvider.select((value) => value.weatherList));

    return Flex(
      direction: Axis.vertical,
      children: [
        if (weatherList.isEmpty)
          Text(Strings.favCitiesAppearHere.tr)
        else
          Expanded(
            child: UIList<HomeScreenIntent>(
              renderers: {
                UIWeather: UIWeatherRenderer(),
              },
              intentHandler: homeViewModel.onIntent,
              items: weatherList,
            ),
          ),
      ],
    );
  }
}
