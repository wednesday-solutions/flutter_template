import 'package:flutter_template/presentation/entity/weather/ui_city.dart';

final uiCity = UICity(
  cityId: 1,
  title: "title",
  locationType: "locationType",
  location: "location",
  isFavourite: false,
  displayTitle: "displayTitle",
  state: "state",
);

final searchList = [
  uiCity,
  uiCity.copyWith(cityId: 2, title: "title 2", isFavourite: true),
];
