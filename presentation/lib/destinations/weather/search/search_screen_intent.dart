import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation_entity/presentation_entity.dart';

part 'search_screen_intent.freezed.dart';

@freezed
class SearchScreenIntent with _$SearchScreenIntent implements BaseIntent {
  factory SearchScreenIntent.back() = _SearchScreenIntent_Back;

  factory SearchScreenIntent.search({required String searchTerm}) =
      _SearchScreenIntent_Search;

  factory SearchScreenIntent.toggleFavorite({required UICity city}) =
      _SearchScreenIntent_Favorite;
}
