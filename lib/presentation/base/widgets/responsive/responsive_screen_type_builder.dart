import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/widgets/responsive/responsive_builder.dart';
import 'package:flutter_template/presentation/entity/base/responsive/responsive_breakpoints.dart';
import 'package:flutter_template/presentation/entity/base/responsive/screen_type.dart';

class ResponsiveScreenTypeBuilder extends StatelessWidget {
  final ResponsiveBreakpoints breakpoints;
  final Widget Function(BuildContext context) mobile;
  final Widget Function(BuildContext context)? mobileLandscape;
  final Widget Function(BuildContext context)? tablet;
  final Widget Function(BuildContext context)? tabletLandscape;
  final Widget Function(BuildContext context)? desktop;

  const ResponsiveScreenTypeBuilder({
    Key? key,
    this.breakpoints = ResponsiveBreakpoints.defaults,
    required this.mobile,
    this.mobileLandscape,
    this.tablet,
    this.tabletLandscape,
    this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, mediaQueryData, boxConstraints) {
        final screenType =
            getScreenType(size: mediaQueryData.size, breakpoints: breakpoints);
        final isLandscape = mediaQueryData.orientation == Orientation.landscape;

        if (screenType == ScreenType.desktop) {
          if (desktop != null) return desktop!(context);
          if (tabletLandscape != null) return tabletLandscape!(context);
          if (tablet != null) return tablet!(context);
        }

        if (screenType == ScreenType.tablet) {
          if (isLandscape && tabletLandscape != null) {
            return tabletLandscape!(context);
          }
          if (tablet != null) return tablet!(context);
        }

        if (isLandscape && mobileLandscape != null) {
          return mobileLandscape!(context);
        }

        return mobile(context);
      },
    );
  }
}
