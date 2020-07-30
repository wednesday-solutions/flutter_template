import 'package:flutter/material.dart';

// This class build method can be used to render widgets with MaterialApp. 

class RenderWithMaterial {
  RenderWithMaterial();
  @override
  Widget build(BuildContext context, Widget child) {
    return MaterialApp(
      title: 'Flutter Test',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Center(
          child: child,
        ),
      ),
    );
  }
}
