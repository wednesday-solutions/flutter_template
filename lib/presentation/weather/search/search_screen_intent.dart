import 'package:flutter_template/presentation/entity/intent/intent.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_screen_intent.freezed.dart';

@freezed
abstract class SearchScreenIntent
    with _$SearchScreenIntent
    implements BaseIntent {
  factory SearchScreenIntent.back() = SearchScreenIntent_Back;

  factory SearchScreenIntent.search({required String searchTerm}) =
      SearchScreenIntent_Search;

  factory SearchScreenIntent.toggleFavorite({required UICity city}) =
      SearchScreenIntent_Favorite;
}
