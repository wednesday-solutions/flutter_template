import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_city.freezed.dart';

@freezed
class UICity with _$UICity implements UIListItem {
  const UICity._();

  factory UICity({
    required int cityId,
    required String title,
    required String locationType,
    required String location,
    required bool isFavourite,
  }) = _UICity;

  @override
  String get key => "UICity $cityId";

  @override
  Type get type => UICity;
}
