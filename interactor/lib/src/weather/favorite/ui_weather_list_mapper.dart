import 'package:domain_entity/domain_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:foundation/foundation.dart';
import 'package:presentation_entity/presentation_entity.dart';

abstract class UIWeatherListMapper extends Mapper<List<Weather>, List<UIListItem>> {}

class UIWeatherListMapperImpl extends UIWeatherListMapper {
  @override
  List<UIListItem> map(List<Weather> from) {
    logD("map: from = $from");
    return (from
          ..sort(
            (a, b) => a.title.compareTo(b.title),
          ))
        .map(
      (weather) {
        return UIWeather(
          lat: weather.lat,
          lon: weather.lon,
          title: weather.title,
          description: toBeginningOfSentenceCase(weather.description)!,
          currentTemp: "${weather.temp.toStringAsPrecision(4)} °C",
          minMaxTemp:
              "With a high of ${weather.maxTemp.toStringAsPrecision(4)} °C and low of ${weather.minTemp.toStringAsPrecision(4)} °C",
          feelsLike: "Feels like: ${weather.feelsLike.toStringAsPrecision(4)} °C",
          iconUrl: weather.iconUrl,
        );
      },
    ).toList();
  }
}
