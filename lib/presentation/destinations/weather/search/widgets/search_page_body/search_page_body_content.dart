import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/destinations/weather/search/widgets/search_page_results/search_page_results.dart';

class SearchPageBodyContent extends StatelessWidget {
  final TextEditingController textController;
  final String searchHint;

  const SearchPageBodyContent({
    Key? key,
    required this.textController,
    required this.searchHint,
  }) : super(key: key);

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
          const SearchPageResults(),
        ],
      ),
    );
  }
}
