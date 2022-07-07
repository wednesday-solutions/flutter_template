import 'package:easy_localization/easy_localization.dart' as el;
import 'package:flutter/cupertino.dart';

extension StringExt on String {
  bool get isBlank => trim().isEmpty;

  // String get tr {
  //   try {
  //     return el.tr(this);
  //   } catch (e) {
  //     return this;
  //   }
  // }
}

///
/// Extension on context to make sure any string that uses [tr] gets translated.
/// Not using the context won't translate the string if its [tr] is being used in non changing components eg. viewModel
///

extension ContextExt on BuildContext {
  String tr(String key) {
    try {
      return el.tr(key);
    } catch (e) {
      return key;
    }
  }
}
