import 'package:flutter/material.dart';
import 'package:presentation/base/intent/intent_handler_callback.dart';
import 'package:presentation/base/translation/translation_ext.dart';
import 'package:presentation/base/widgets/list/ui_list.dart';
import 'package:presentation/base/widgets/responsive/responsive_builder.dart';
import 'package:presentation/destinations/weather/home/home_screen_intent.dart';
import 'package:presentation/destinations/weather/home/widgets/list/ui_weather_renderer.dart';
import 'package:presentation/intl/translations/translation_keys.dart';
import 'package:presentation_entity/presentation_entity.dart';

class HomePageBodyContent extends StatelessWidget {
  final List<UIListItem> weatherList;
  final IntentHandlerCallback<HomeScreenIntent> intentHandler;

  const HomePageBodyContent({
    Key? key,
    required this.weatherList,
    required this.intentHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (weatherList.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          LocaleKeys.favCitiesAppearHere.tr,
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return ResponsiveBuilder(
        builder: (context, mediaQueryData, boxConstraints) {
          final columns = mediaQueryData.orientation == Orientation.landscape ? 2 : 1;
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
