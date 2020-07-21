import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/database/weather_database.dart';
import 'package:flutter_template/di/service_locator.dart';
import 'package:flutter_template/model/city.dart';
import 'package:flutter_template/model/consolidated_weather.dart';
import 'package:flutter_template/model/weather.dart';
import 'package:flutter_template/network/weather_api_service.dart';
import 'package:flutter_template/routes/cities_route.dart';

class WeatherRoute extends StatefulWidget {
  @override
  _WeatherRouteState createState() => _WeatherRouteState();
}

class _WeatherRouteState extends State<WeatherRoute> {

  List<City> cities;
  StreamSubscription<List<City>> cityDatabaseSubscription;

  @override
  void initState() {
    super.initState();

    final updateCitiesState = (cities) {
      setState(() {
        this.cities = cities.toList();
      });
    };
    sl<WeatherDatabase>().cityDao.allCitiesFuture().then(updateCitiesState);
    cityDatabaseSubscription = sl<WeatherDatabase>().cityDao.allCities().listen(updateCitiesState);
  }

  @override
  void dispose() {
    cityDatabaseSubscription.cancel();
    super.dispose();
  }

  List<Future<Weather>> callWeatherApiForAllCities() {
    if (this.cities != null) {
      return this.cities.map((city) {
        return sl<WeatherAPIService>().weatherForCity(city.woeid);
      }).toList();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  CitiesRoute()));
        })]
      ),
      body: FutureBuilder<List<Weather>>(
        future: Future.wait(callWeatherApiForAllCities()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator()
            );
          }
          if (snapshot.hasData) {
            return WeatherList(snapshot.data);
          }
          return Center(child: Text('Add a city'));
        },
      ),
    );
  }
}

class WeatherList extends StatelessWidget {

  final List<Weather> weatherData;

  WeatherList(this.weatherData);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      addAutomaticKeepAlives: false,
      itemCount: weatherData.length,
      itemBuilder: (BuildContext context, int index) {
        final weather = weatherData[index];
        return ListTile(
            title: Text('${weather.title}'),
            subtitle: Text('Min Temp: ${weather.consolidatedWeathers[0].minTemp.round()}° Max Temp: ${weather.consolidatedWeathers[0].maxTemp.round()}°'),
            trailing: weather.consolidatedWeathers[0].weatherConditionImage(),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(color: Colors.grey);
      },
    );
  }
}
