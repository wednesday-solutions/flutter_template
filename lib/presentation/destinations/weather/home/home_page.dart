import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/page/base_page.dart';
import 'package:flutter_template/presentation/base/widgets/theme/theme_picker/theme_picker.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_screen.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_screen_state.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_view_model.dart';

import 'widgets/home_page_body/home_page_body.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  final HomeScreen homeScreen;

  const HomePage({
    super.key,
    this.homeScreen = const HomeScreen(),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage<HomeScreen, HomeScreenState, HomeViewModel>(
      viewModelProvider: homeViewModelProvider,
      screen: homeScreen,
      appBarActions: () => [
        IconButton(
          onPressed: () {
            String locale = context.locale.toString();
            if (locale == "hi_IN") {
              context.setLocale(const Locale("en", "US"));
            } else {
              context.setLocale(const Locale("hi", "IN"));
            }
          },
          icon: const Icon(Icons.language),
        ),
        IconButton(
          onPressed: () {
            final viewModel = ref.watch(homeViewModelProvider.notifier);
            viewModel.onIntent(const SearchHomeScreenIntent());
          },
          icon: const Icon(Icons.search),
        ),
        const ThemePicker(),
      ],
      body: const HomePageBody(),
    );
  }
}
