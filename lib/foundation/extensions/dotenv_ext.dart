import 'package:flutter_dotenv/flutter_dotenv.dart';

extension DotEnvExt on DotEnv {
  bool getBoolOrDefault(String key, {required bool fallback}) {
    final booleanString = dotenv.maybeGet(key);

    if (booleanString == null) return fallback;

    if (booleanString.toLowerCase() == 'true') return true;
    if (booleanString.toLowerCase() == 'false') return false;

    return fallback;
  }
}
