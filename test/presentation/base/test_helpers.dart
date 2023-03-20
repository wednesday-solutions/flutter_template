import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_template/flavors/flavor_config.dart';

Future baseSetupAll() async {
  await dotenv.load(mergeWith: {
    "OPEN_WEATHER_API_KEY": "290db4544b0595e443828fc7a82933cd",
    "OPEN_WEATHER_BASE_URL": "https://api.openweathermap.org/"
  });
  FlavorConfig.initialize(flavorString: "test");
}
