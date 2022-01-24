import 'package:flutter/material.dart';

class UICityListItem extends StatelessWidget {
  final String text;

  const UICityListItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
