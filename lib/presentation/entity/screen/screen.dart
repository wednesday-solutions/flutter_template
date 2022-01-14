import 'package:flutter_template/presentation/entity/routes/routes.dart';

abstract class Screen {
  Screen._();

  String get path;
}

class SearchScreen extends Screen {
  final String temp;
  SearchScreen(this.temp) : super._();

  @override
  String get path => Routes.SEARCH;
}
