import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/widgets/page/base_page.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/weather/search/search_controller.dart';
import 'package:flutter_template/presentation/weather/search/search_screen_state.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage<SearchScreen, SearchScreenState, SearchController>(
      body: Center(
        child: Text("Search Page"),
      ),
    );
  }
}
