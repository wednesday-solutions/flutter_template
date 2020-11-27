
import 'package:flutter/material.dart';
import 'package:flutter_template/database/weather_database.dart';
import 'package:flutter_template/di/service_locator.dart';
import 'package:flutter_template/model/city.dart';
import 'package:flutter_template/network/weather_api_service.dart';

class CitiesRoute extends StatefulWidget {
  @override
  _CitiesRouteState createState() => _CitiesRouteState();
}

class _CitiesRouteState extends State<CitiesRoute> {
  var _searchText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a City')
      ),
      body: Form(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: TextFormField(
                      onFieldSubmitted: (value) {
                        setState(() {
                          _searchText = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'City',
                        hintText: 'Chicago',
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child:FutureBuilder<List<List<City>>>(
                future: Future.wait([
                  sl<WeatherAPIService>().searchCities(_searchText),
                  sl<WeatherDatabase>().cityDao.allCitiesFuture()
                ]),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator()
                    );
                  }
                  if (snapshot.hasData) {
                    final citiesFromAPI = snapshot.data[0];
                    final selectedCities = snapshot.data[1];
                    if (citiesFromAPI.length > 0) {
                      return Cities(citiesFromAPI, selectedCities, (selectedCity) {
                        sl<WeatherDatabase>().cityDao.insertCity(selectedCity);
                        Navigator.pop(context);
                      });
                    }
                  }
                  return Center(child: Text('Search for a city'));
                },
              ),
            )
          ],
       ))
    );
  }
}

class Cities extends StatelessWidget {
  final List<City> cities;
  final List<City> selectedCities;
  final onCitySelected;

  Cities(this.cities, this.selectedCities, this.onCitySelected);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      addAutomaticKeepAlives: false,
      itemCount: cities.length,
      itemBuilder: (BuildContext context, int index) {
        final city = cities[index];
        return ListTile(
            title: Text(city.title),
            trailing: selectedCities.any((element) => city.title == element.title) ? Icon(Icons.check) : null,
            onTap: () => this.onCitySelected(cities[index])
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(color: Colors.grey);
      },
    );
  }
}
