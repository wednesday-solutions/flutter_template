import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';

abstract class ListItemRenderer<T extends UIListItem> {
  Widget getWidget(BuildContext context, T data);
}
