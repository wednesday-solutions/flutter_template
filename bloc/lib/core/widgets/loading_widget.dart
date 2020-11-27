import 'package:flutter/material.dart';

class WidgetLoading extends StatelessWidget {
  final String loadingMessage;

  const WidgetLoading({Key key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          ),
          if (loadingMessage != null) Text(loadingMessage)
        ],
      ),
    );
  }
}
