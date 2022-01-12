import 'package:flutter_template/presentation/entity/list/ui_list_item.dart';

class UICity extends UIListItem {
  final int cityId;
  final String title;
  final String locationType;
  final String location;
  final bool isFavourite;

  UICity({
    required this.cityId,
    required this.title,
    required this.locationType,
    required this.location,
    required this.isFavourite,
  }) : super(key: "UICity $cityId");
}
