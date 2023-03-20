import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';
import 'flavors/flavor_config.dart';

void main() async {
  const flavor = String.fromEnvironment("flavor", defaultValue: "dev");

  await dotenv.load(
    fileName: getEnvFileName(flavor),
  );

  FlavorConfig.initialize(flavorString: flavor);
  startApp();
}

String getEnvFileName(String flavor) {
  switch (flavor) {
    case "prod":
      return ".env";
    case "qa":
      return ".env.qa";
    default:
      return ".env.dev";
  }
}
