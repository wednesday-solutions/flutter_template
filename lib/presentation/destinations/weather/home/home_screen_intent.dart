import 'package:flutter_template/presentation/entity/intent/intent.dart';

sealed class HomeScreenIntent implements BaseIntent {
  const HomeScreenIntent();
}

class SearchHomeScreenIntent extends HomeScreenIntent {
  const SearchHomeScreenIntent();
}
