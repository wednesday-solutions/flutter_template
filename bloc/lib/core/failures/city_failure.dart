
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_failure.freezed.dart';

@freezed
abstract class CityFailure with _$CityFailure {
  const factory CityFailure.unknown({String message}) = _Unknown;
  const factory CityFailure.noMatchingResults({String message}) = _NoMatchingResults;
  const factory CityFailure.requestTimeOut({String message}) = _RequestTimeout;
  const factory CityFailure.unableToFetch({String message}) = _UnableToFetch;
  const factory CityFailure.invalidData({String message}) = _InvalidData;
}