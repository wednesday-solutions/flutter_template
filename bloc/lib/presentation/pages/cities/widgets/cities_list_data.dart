import 'package:flutter/material.dart';
import 'package:flutter_template_bloc/data/model/city.dart';
import 'package:flutter_template_bloc/presentation/pages/cities/bloc/cities_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:provider/provider.dart';

class CitiesListData extends StatelessWidget {
  final KtList<City> loadedCities;

  const CitiesListData(this.loadedCities);

  @override
  Widget build(BuildContext context) {
    final CitiesBloc citiesBloc = Provider.of<CitiesBloc>(context);
    return ListView.separated(
      addAutomaticKeepAlives: false,
      itemCount: loadedCities.size,
      itemBuilder: (BuildContext context, int index) {
        final city = loadedCities[index];
        return ListTile(
          title: Text(city.title),
          trailing: city.isSelected ? const Icon(Icons.check) : const SizedBox(),
          onTap: () {
            citiesBloc.add(CitiesEvent.selectCity(loadedCities, index));
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(color: Colors.grey);
      },
    );
  }
}