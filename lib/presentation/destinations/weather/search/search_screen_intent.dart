import 'package:flutter_template/presentation/entity/intent/intent.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';

sealed class SearchScreenIntent extends BaseIntent {
  const SearchScreenIntent();
}

class BackSearchScreenIntent extends SearchScreenIntent {
  const BackSearchScreenIntent();

  @override
  List<Object?> get props => [];
}

class SearchSearchScreenIntent extends SearchScreenIntent {
  final String searchTerm;

  const SearchSearchScreenIntent({required this.searchTerm});

  @override
  List<Object?> get props => [searchTerm];
}

class ToggleFavoriteSearchScreenIntent extends SearchScreenIntent {
  final UICity city;

  const ToggleFavoriteSearchScreenIntent({required this.city});

  @override
  List<Object?> get props => [city];
}
