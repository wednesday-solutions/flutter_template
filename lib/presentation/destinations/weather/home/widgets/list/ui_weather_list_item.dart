import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: Axis.vertical,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weather.title,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          weather.currentTemp,
                          style: const TextStyle(fontSize: 40),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Image(
                    image: CachedNetworkImageProvider(
                      weather.iconUrl,
                    ),
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                weather.feelsLike,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                weather.minMaxTemp,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(weather.description),
            ],
          ),
        ),
      ),
    );
  }
}
