// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/entity/base/responsive/responsive_breakpoints.dart';

enum ScreenType {
  mobile,
  tablet,
  desktop,
}

ScreenType getScreenType({
  required Size size,
  ResponsiveBreakpoints breakpoints = ResponsiveBreakpoints.defaults,
}) {
  double width = size.shortestSide;

  if (kIsWeb) {
    width = size.width;
  }

  if (width >= breakpoints.desktop) {
    return ScreenType.desktop;
  }

  if (width >= breakpoints.tablet) {
    return ScreenType.tablet;
  }

  return ScreenType.mobile;
}
