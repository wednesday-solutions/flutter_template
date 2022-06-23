import 'dart:async';

import 'package:flutter/material.dart';
import 'package:presentation_entity/presentation_entity.dart';

abstract class ListItemRenderer<T extends UIListItem, I extends BaseIntent> {
  const ListItemRenderer();

  Widget getWidget(BuildContext context, T data, StreamSink<I> sink);
}
