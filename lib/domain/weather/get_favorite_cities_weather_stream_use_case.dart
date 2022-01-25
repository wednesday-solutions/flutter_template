import 'package:flutter_template/domain/base/usecase/base_stream_use_case.dart';
import 'package:flutter_template/domain/entity/weather/weather.dart';
import 'package:flutter_template/foundation/unit.dart';

abstract class GetFavoriteCitiesWeatherStreamUseCase
    extends BaseStreamUseCase<Unit, List<Weather>> {}
