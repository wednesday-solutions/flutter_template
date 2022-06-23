import 'package:domain/interface/datetime/format_date_use_case.dart';
import 'package:domain_entity/domain_entity.dart';
import 'package:repository/repository.dart';
import 'package:tuple/tuple.dart';

class FormatDateUseCaseImpl extends FormatDateUseCase {
  final DateRepository dateRepository;

  FormatDateUseCaseImpl({required this.dateRepository});

  @override
  String callInternal(Tuple2<Date, String> param) {
    return dateRepository.formatDate(param.item1, param.item2);
  }
}
