import 'package:domain/src/base/usecase/base_unsafe_use_case.dart';
import 'package:domain_entity/domain_entity.dart';
import 'package:tuple/tuple.dart';

abstract class FormatDateUseCase extends BaseUnsafeUseCase<Tuple2<Date, String>, String> {}
