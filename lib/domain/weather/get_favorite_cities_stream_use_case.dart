import 'package:flutter_template/domain/base/usecase/base_stream_use_case.dart';
import 'package:flutter_template/domain/entity/weather/city.dart';
import 'package:flutter_template/foundation/unit.dart';

abstract class GetFavoriteCitiesStreamUseCase
    extends BaseStreamUseCase<Unit, List<City>> {}
