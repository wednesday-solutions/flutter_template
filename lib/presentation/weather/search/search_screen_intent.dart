import 'package:flutter_template/presentation/entity/intent/intent.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_screen_intent.freezed.dart';

@freezed
abstract class SearchScreenIntent with _$SearchScreenIntent implements BaseIntent {
  factory SearchScreenIntent.back() = SearchScreenIntent_Back;

  factory SearchScreenIntent.search({required String searchTerm}) =
      SearchScreenIntent_Search;

  factory SearchScreenIntent.favorite({required int cityId, required bool isFavorite,}) = SearchScreenIntent_Favorite;
}
