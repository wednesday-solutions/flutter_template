import 'package:flutter/material.dart';
import 'package:flutter_template_bloc/data/model/weather.dart';
import 'package:kt_dart/collection.dart';

class WeatherList extends StatelessWidget {
  final KtList<Weather> weatherList;

  const WeatherList({@required this.weatherList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      addAutomaticKeepAlives: false,
      itemCount: weatherList.size,
      itemBuilder: (BuildContext context, int index) {
        final weather = weatherList[index];
        return ListTile(
          title: Text(weather.title),
          subtitle: Text(
              'Min Temp: ${weather.consolidatedWeathers[0].minTemp.round()}° Max Temp: ${weather.consolidatedWeathers[0].maxTemp.round()}°'),
          trailing: weather.consolidatedWeathers[0].weatherConditionImage(),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(color: Colors.grey);
      },
    );
  }
}
