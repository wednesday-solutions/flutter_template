import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/widgets/list/ui_list.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/destinations/weather/home/list/ui_day_weather_heading_renderer.dart';
import 'package:flutter_template/presentation/destinations/weather/home/list/ui_day_weather_renderer.dart';
import 'package:flutter_template/presentation/entity/weather/ui_day_weather.dart';
import 'package:flutter_template/presentation/entity/weather/ui_day_weather_heading.dart';
import 'package:flutter_template/presentation/entity/weather/ui_weather.dart';

class UIWeatherListItem extends StatelessWidget {
  final UIWeather weather;

  const UIWeatherListItem({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    weather.title,
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(
                    weather.currentTemp,
                    style: const TextStyle(fontSize: 30),
                  ),
                ],
              ),
              UIList<HomeScreenIntent>(
                renderers: const {
                  UIDayWeatherHeading: UIDayWeatherHeaderRenderer(),
                  UIDayWeather: UIDayWeatherRenderer()
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                intentHandler: null,
                items: weather.dayWeatherList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
