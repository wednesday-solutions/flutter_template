import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/exceptions/renderer_not_registered_exception.dart';
import 'package:flutter_template/presentation/base/renderer/list_item_renderer.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';

class UIList extends StatelessWidget {
  final Map<Type, ListItemRenderer> renderers;
  final List<UIListItem> items;

  const UIList({Key? key, required this.renderers, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = items[index];
        final type = item.runtimeType;
        final renderer = renderers[type];
        if (renderer == null) {
          throw RendererNotRegisteredForTypeException(type);
        }

        return renderer.getWidget(item);
      },
      itemCount: items.length,
    );
  }
}
