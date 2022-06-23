import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, MediaQueryData mediaQueryData,
      BoxConstraints boxConstraints) builder;

  const ResponsiveBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      final mediaQueryData = MediaQuery.of(context);
      return builder(context, mediaQueryData, boxConstraints);
    });
  }
}
