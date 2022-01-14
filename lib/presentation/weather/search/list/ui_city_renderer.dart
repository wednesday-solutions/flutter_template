import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/renderer/list_item_renderer.dart';
import 'package:flutter_template/presentation/entity/weather/ui_city.dart';

class UICityRenderer extends ListItemRenderer<UICity> {
  @override
  Widget getWidget(BuildContext context, UICity data) {
    return Text(data.title);
  }

}