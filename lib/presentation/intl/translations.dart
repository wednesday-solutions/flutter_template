import 'package:flutter_template/presentation/intl/strings.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          Strings.homePageTitle: "Home",
          Strings.searchPageTitle: "Search",
        }
      };
}
