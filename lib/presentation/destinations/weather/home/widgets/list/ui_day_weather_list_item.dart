import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/entity/weather/ui_day_weather.dart';

class UIDayWeatherListItem extends StatelessWidget {
  final UIDayWeather dayWeather;

  const UIDayWeatherListItem({
    Key? key,
    required this.dayWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(dayWeather.date),
        Text(dayWeather.currentTemp),
      ],
    );
  }
}
