import 'package:easy_localization/easy_localization.dart' as el;

extension StringExt on String {
  bool get isBlank => trim().isEmpty;

  String get tr {
    try {
      return el.tr(this);
    } catch (e) {
      return this;
    }
  }
}
