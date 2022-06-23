import 'package:easy_localization/easy_localization.dart' as el;

extension TranslationExt on String {
  String get tr {
    try {
      return el.tr(this);
    } catch (e) {
      return this;
    }
  }
}
