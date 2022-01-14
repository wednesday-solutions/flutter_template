import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_template/foundation/logger/logger.dart';
import 'package:flutter_template/presentation/base/exceptions/renderer_not_registered_exception.dart';
import 'package:flutter_template/presentation/base/renderer/list_item_renderer.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';

class UIList extends StatelessWidget {
  final Map<Type, ListItemRenderer> renderers;
  final List<UIListItem> items;
  final Axis scrollDirection;

  const UIList({
    Key? key,
    required this.renderers,
    required this.items,
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log.e("List length: ${items.length}");

    if (items.length > 0) {
      return Expanded(
        child: ListView.builder(
          scrollDirection: scrollDirection,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = items[index];
            final type = item.type;
            final renderer = renderers[type];
            if (renderer == null) {
              throw RendererNotRegisteredForTypeException(type);
            }

            return renderer.getWidget(context, item);
          },
          itemCount: items.length,
        ),
      );
    }

    return SizedBox();
  }
}
