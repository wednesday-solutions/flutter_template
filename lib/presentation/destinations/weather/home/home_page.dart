import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/page/base_page.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_screen_state.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_view_model.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';

import 'widgets/home_page_body/home_page_body.dart';

class HomePage extends ConsumerWidget {
  final HomeScreen homeScreen;

  const HomePage({
    Key? key,
    required this.homeScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage<HomeScreen, HomeScreenState, HomeViewModel>(
      viewModelProvider: homeViewModelProvider,
      screen: homeScreen,
      appBarActions: () => [
        IconButton(
          onPressed: () {
            final viewModel = ref.watch(homeViewModelProvider.notifier);
            viewModel.onIntent(HomeScreenIntent.search());
          },
          icon: const Icon(Icons.search),
        )
      ],
      body: const HomePageBody(),
    );
  }
}
