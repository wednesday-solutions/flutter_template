import 'package:domain/src/base/usecase/base_stream_use_case.dart';
import 'package:domain_entity/domain_entity.dart';
import 'package:foundation/foundation.dart';

abstract class GetFavoriteCitiesStreamUseCase
    extends BaseStreamUseCase<Unit, List<City>> {}
