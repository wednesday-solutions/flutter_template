import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/exceptions/renderer_not_registered_exception.dart';
import 'package:flutter_template/presentation/base/intent/intent_handler.dart';
import 'package:flutter_template/presentation/base/renderer/list_item_renderer.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:flutter_template/presentation/entity/intent/intent.dart';

class UIList<INTENT extends BaseIntent> extends StatefulWidget {
  final Map<Type, ListItemRenderer> renderers;
  final IntentHandler<INTENT>? intentHandler;
  final List<UIListItem> items;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const UIList(
      {Key? key,
      required this.renderers,
      required this.intentHandler,
      required this.items,
      this.scrollDirection = Axis.vertical,
      this.shrinkWrap = false,
      this.physics = null})
      : super(key: key);

  @override
  State<UIList> createState() => _UIListState<INTENT>();
}

class _UIListState<INTENT extends BaseIntent> extends State<UIList> {
  late final StreamController<INTENT> intentStreamController;

  @override
  void initState() {
    super.initState();
    intentStreamController = StreamController();
    intentStreamController.stream.listen((event) {
      widget.intentHandler?.onIntent(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.length > 0) {
      return ListView.builder(
        scrollDirection: widget.scrollDirection,
        shrinkWrap: widget.shrinkWrap,
        physics: widget.physics,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          final type = item.type;
          final renderer = widget.renderers[type];
          if (renderer == null) {
            throw RendererNotRegisteredForTypeException(type);
          }

          return renderer.getWidget(context, item, intentStreamController.sink);
        },
        itemCount: widget.items.length,
      );
    }

    return SizedBox();
  }

  @override
  void dispose() {
    super.dispose();
    intentStreamController.close();
  }
}
