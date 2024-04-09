import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, MediaQueryData mediaQueryData,
      BoxConstraints boxConstraints) builder;

  const ResponsiveBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      final mediaQueryData = MediaQuery.of(context);
      return builder(context, mediaQueryData, boxConstraints);
    });
  }
}
