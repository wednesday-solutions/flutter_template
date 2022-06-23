import 'package:domain/interface/datetime/date_in_millis_use_case.dart';
import 'package:domain_entity/domain_entity.dart';
import 'package:repository/repository.dart';

class DateInMillisUseCaseImpl extends DateInMillisUseCase {
  final DateRepository dateRepository;

  DateInMillisUseCaseImpl({required this.dateRepository});

  @override
  int callInternal(Date param) {
    return dateRepository.convertDateToMillis(param);
  }
}
