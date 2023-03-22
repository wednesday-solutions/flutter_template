import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_template/flavors/flavor_config.dart';

Future baseSetupAll() async {
  await dotenv.load(fileName: ".env.test");
  FlavorConfig.initialize(flavorString: "test");
}
