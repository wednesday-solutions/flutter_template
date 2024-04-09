import 'package:flutter/material.dart';
import 'package:flutter_template/foundation/extensions/context_ext.dart';
import 'package:flutter_template/presentation/intl/translations/translation_keys.dart';

class DynamicThemeSwitchContent extends StatelessWidget {
  final bool isDynamic;
  final void Function(bool) onIsDynamicToggled;

  const DynamicThemeSwitchContent({
    super.key,
    required this.isDynamic,
    required this.onIsDynamicToggled,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(context.tr(LocaleKeys.dynamicTheme)),
        const Spacer(),
        Switch(
          value: isDynamic,
          onChanged: onIsDynamicToggled,
        )
      ],
    );
  }
}
