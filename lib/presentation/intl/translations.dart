import 'package:flutter_template/presentation/intl/strings.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          Strings.homePageTitle: "Home",
          Strings.searchPageTitle: "Search",
          Strings.forecast: "Forecast",
          Strings.favCitiesAppearHere:
              "Weather for your favorite cities will appear here. Search cities to add to favorites.",
          Strings.startTypingToSearch: "Start typing to search",
          Strings.searchResultsAppearHere: "Search results appear here...",
          Strings.noResultsFound: "No results found...",
        }
      };
}
