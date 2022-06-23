import 'package:domain/src/base/usecase/base_async_use_case.dart';
import 'package:domain_entity/domain_entity.dart';

abstract class SearchCitiesUseCase extends BaseAsyncUseCase<String, List<City>> {}
