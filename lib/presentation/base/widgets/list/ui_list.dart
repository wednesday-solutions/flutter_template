import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_template/presentation/base/exceptions/renderer_not_registered_exception.dart';
import 'package:flutter_template/presentation/base/renderer/list_item_renderer.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:flutter_template/presentation/entity/intent/intent.dart';

class UIList<INTENT extends BaseIntent> extends StatefulWidget {
  final Map<Type, ListItemRenderer> renderers;
  final Function(INTENT intent)? intentHandler;
  final List<UIListItem> items;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final int numberOfColumns;
  final SliverGridDelegate? gridDelegate;

  const UIList({
    Key? key,
    required this.renderers,
    required this.intentHandler,
    required this.items,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
    this.physics,
    this.numberOfColumns = 1,
    this.gridDelegate,
  }) : super(key: key);

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
      widget.intentHandler?.call(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    final physics = widget.physics;
    final scrollDirection = widget.scrollDirection;
    final shrinkWrap = widget.shrinkWrap;
    final columns = widget.numberOfColumns;
    final items = widget.items;
    if (items.isNotEmpty) {
      if (columns > 1) {
        return AlignedGridView.count(
          crossAxisCount: columns,
          scrollDirection: scrollDirection,
          shrinkWrap: shrinkWrap,
          physics: physics,
          itemBuilder: _itemBuilder,
          itemCount: items.length,
        );
      } else {
        return ListView.builder(
          scrollDirection: scrollDirection,
          shrinkWrap: shrinkWrap,
          physics: physics,
          itemBuilder: _itemBuilder,
          itemCount: items.length,
        );
      }
    }

    return const SizedBox();
  }

  Widget _itemBuilder(context, index) {
    final item = widget.items[index];
    final type = item.type;
    final renderer = widget.renderers[type];
    if (renderer == null) {
      throw RendererNotRegisteredForTypeException(type);
    }

    return renderer.getWidget(context, item, intentStreamController.sink);
  }

  @override
  void dispose() {
    super.dispose();
    intentStreamController.close();
  }
}
