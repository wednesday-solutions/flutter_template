import 'package:flutter/material.dart';
import 'package:flutter_template/foundation/extensions/context_ext.dart';
import 'package:flutter_template/presentation/base/intent/intent_handler_callback.dart';
import 'package:flutter_template/presentation/base/widgets/list/ui_list.dart';
import 'package:flutter_template/presentation/base/widgets/responsive/responsive_builder.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:flutter_template/presentation/entity/weather/ui_weather.dart';
import 'package:flutter_template/presentation/intl/translations/translation_keys.dart';

import '../list/ui_weather_renderer.dart';

class HomePageBodyContent extends StatelessWidget {
  final List<UIListItem> weatherList;
  final IntentHandlerCallback<HomeScreenIntent> intentHandler;

  const HomePageBodyContent({
    super.key,
    required this.weatherList,
    required this.intentHandler,
  });

  @override
  Widget build(BuildContext context) {
    if (weatherList.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          context.tr(LocaleKeys.favCitiesAppearHere),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return ResponsiveBuilder(
        builder: (context, mediaQueryData, boxConstraints) {
          final columns =
              mediaQueryData.orientation == Orientation.landscape ? 2 : 1;
          return UIList<HomeScreenIntent>(
            renderers: const {
              UIWeather: UIWeatherRenderer(),
            },
            numberOfColumns: columns,
            intentHandler: intentHandler,
            items: weatherList,
          );
        },
      );
    }
  }
}
