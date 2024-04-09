import 'package:flutter/material.dart';

class SearchPageBodyContent extends StatelessWidget {
  final TextEditingController textController;
  final String searchHint;
  final Widget child;

  const SearchPageBodyContent({
    super.key,
    required this.textController,
    required this.searchHint,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Flex(
        direction: Axis.vertical,
        children: [
          TextField(
            controller: textController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: searchHint,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
