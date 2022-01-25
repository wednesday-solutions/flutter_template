import 'package:flutter_template/domain/base/usecase/base_async_use_case.dart';
import 'package:flutter_template/domain/entity/weather/city.dart';

abstract class SearchCitiesUseCase
    extends BaseAsyncUseCase<String, List<City>> {}
