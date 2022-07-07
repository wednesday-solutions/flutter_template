import 'package:flutter/material.dart';
import 'package:flutter_template/foundation/extensions/context_ext.dart';
import 'package:flutter_template/presentation/intl/translations/translation_keys.dart';

class DynamicThemeSwitchContent extends StatelessWidget {
  final bool isDynamic;
  final void Function(bool) onIsDynamicToggled;

  const DynamicThemeSwitchContent({
    Key? key,
    required this.isDynamic,
    required this.onIsDynamicToggled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(context.tr(LocaleKeys.dynamicTheme)),
        Switch(
          value: isDynamic,
          onChanged: onIsDynamicToggled,
        )
      ],
    );
  }
}
