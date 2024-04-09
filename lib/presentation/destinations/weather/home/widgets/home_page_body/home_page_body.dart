import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_view_model.dart';
import 'package:flutter_template/presentation/destinations/weather/home/widgets/home_page_body/home_page_body_content.dart';

class HomePageBody extends ConsumerWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.watch(homeViewModelProvider.notifier);
    final weatherList = ref.watch(
      homeViewModelProvider.select((value) => value.weatherList),
    );

    return HomePageBodyContent(
      weatherList: weatherList,
      intentHandler: homeViewModel.onIntent,
    );
  }
}
