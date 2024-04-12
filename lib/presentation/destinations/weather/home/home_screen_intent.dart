import 'package:flutter_template/presentation/entity/intent/intent.dart';

sealed class HomeScreenIntent extends BaseIntent {
  const HomeScreenIntent();
}

class SearchHomeScreenIntent extends HomeScreenIntent {
  const SearchHomeScreenIntent();

  @override
  List<Object?> get props => [];
}
