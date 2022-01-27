import 'package:flutter_template/domain/datetime/format_date_use_case.dart';
import 'package:flutter_template/domain/entity/weather/day_weather.dart';
import 'package:flutter_template/foundation/mapper/mapper2.dart';
import 'package:flutter_template/presentation/entity/weather/ui_day_weather.dart';
import 'package:tuple/tuple.dart';

abstract class UIDayWeatherMapper
    extends Mapper2<DayWeather, int, UIDayWeather> {}

class UIDayWeatherMapperImpl extends UIDayWeatherMapper {
  final FormatDateUseCase formatDateUseCase;

  UIDayWeatherMapperImpl({required this.formatDateUseCase});

  @override
  UIDayWeather map(DayWeather from1, int from2) {
    const displayDateFormat = "dd MMM yy";
    return UIDayWeather(
      cityId: from2,
      currentTemp: "${from1.temp} °C",
      minMaxTemp: "${from1.minTemp} - ${from1.maxTemp} °C",
      date: formatDateUseCase(Tuple2(
        from1.date,
        displayDateFormat,
      )),
    );
  }
}
