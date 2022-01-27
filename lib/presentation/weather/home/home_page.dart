import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/controller/controller_extendsions.dart';
import 'package:flutter_template/presentation/base/widgets/list/ui_list.dart';
import 'package:flutter_template/presentation/base/widgets/observable/memoised_obx.dart';
import 'package:flutter_template/presentation/base/widgets/page/base_page.dart';
import 'package:flutter_template/presentation/entity/base/ui_list_item.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/entity/weather/ui_weather.dart';
import 'package:flutter_template/presentation/intl/strings.dart';
import 'package:flutter_template/presentation/weather/home/home_controller.dart';
import 'package:flutter_template/presentation/weather/home/home_screen_intent.dart';
import 'package:flutter_template/presentation/weather/home/home_screen_state.dart';
import 'package:flutter_template/presentation/weather/home/list/ui_weather_renderer.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage<HomeScreen, HomeScreenState, HomeController>(
      appBarActions: (controller) => [
        IconButton(
            onPressed: () {
              controller.onIntent(HomeScreenIntent.search());
            },
            icon: Icon(Icons.search))
      ],
      body: (context, controller) {
        return Obx(
          // selector: (BuildContext context) => controller.state.weatherList,
          () => Flex(
            direction: Axis.vertical,
            children: [
              if (controller.state.weatherList.isEmpty)
                Text(Strings.favCitiesAppearHere.tr)
              else
                Expanded(
                  child: UIList<HomeScreenIntent>(
                    renderers: {
                      UIWeather: UIWeatherRenderer(),
                    },
                    intentHandler: controller,
                    items: controller.state.weatherList,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
