import 'package:flutter_template/domain/datetime/date_in_millis_use_case.dart';
import 'package:flutter_template/domain/entity/base/datetime/date.dart';
import 'package:flutter_template/repository/date/date_repository.dart';

class DateInMillisUseCaseImpl extends DateInMillisUseCase {
  final DateRepository dateRepository;

  DateInMillisUseCaseImpl({required this.dateRepository});

  @override
  int callInternal(Date param) {
    return dateRepository.convertDateToMillis(param);
  }
}
