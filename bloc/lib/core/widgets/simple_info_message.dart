import 'package:flutter/material.dart';

class SimpleInfoMessage extends StatelessWidget {
  final String infoMessage;

  const SimpleInfoMessage({Key key, this.infoMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        infoMessage,
        style: const TextStyle(fontSize: 25),
      ),
    );
  }
}
