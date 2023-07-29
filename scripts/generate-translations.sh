#!/bin/sh

dart run easy_localization:generate -S assets/translations -O lib/presentation/intl/translations -o translation_loader.dart

dart run easy_localization:generate -S assets/translations -O lib/presentation/intl/translations -o translation_keys.dart -f keys
