import 'package:flutter/material.dart';
import 'package:flutter_template/foundation/extensions/theme_ext.dart';

extension TextStyleExtension on TextStyle {
  TextStyle onCard(BuildContext context) =>
      copyWith(color: context.theme.colorScheme.onSurface);
}
