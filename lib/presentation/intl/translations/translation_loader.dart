// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en_US = {
    "homePageTitle": "Home",
    "searchPageTitle": "Search",
    "forecast": "Forecast",
    "favCitiesAppearHere":
        "Weather for your favorite cities will appear here. Search cities to add to favorites.",
    "startTypingToSearch": "Start typing to search",
    "searchResultsAppearHere": "Search results appear here...",
    "noResultsFound": "No results found...",
    "dynamicTheme": "Dynamic Theme"
  };
  static const Map<String, dynamic> hi_IN = {
    "homePageTitle": "मुख्य पृष्ठ",
    "searchPageTitle": "खोज",
    "forecast": "पूर्वानुमान",
    "favCitiesAppearHere":
        "आपके पसंदीदा शहरों का मौसम यहां दिखाई देगा। पसंदीदा में जोड़ने के लिए शहर खोजें।",
    "startTypingToSearch": "खोजने के लिए टाइप करना प्रारंभ करें",
    "searchResultsAppearHere": "खोज परिणाम यहां दिखाई देते हैं...",
    "noResultsFound": "कोई परिणाम नहीं मिला...",
    "dynamicTheme": "डायनामिक थीम"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en_US": en_US,
    "hi_IN": hi_IN
  };
}
