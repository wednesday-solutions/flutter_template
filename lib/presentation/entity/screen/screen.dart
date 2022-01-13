import 'package:flutter_template/presentation/entity/routes/routes.dart';

abstract class Screen {
  Screen._();

  String get path;
}

class SearchScreen extends Screen {
  SearchScreen() : super._();

  @override
  String get path => Routes.SEARCH;
}
