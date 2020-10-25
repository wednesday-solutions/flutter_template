// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'city_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CityFailureTearOff {
  const _$CityFailureTearOff();

// ignore: unused_element
  _Unknown unknown({String message}) {
    return _Unknown(
      message: message,
    );
  }

// ignore: unused_element
  _NoMatchingResults noMatchingResults({String message}) {
    return _NoMatchingResults(
      message: message,
    );
  }

// ignore: unused_element
  _RequestTimeout requestTimeOut({String message}) {
    return _RequestTimeout(
      message: message,
    );
  }

// ignore: unused_element
  _UnableToFetch unableToFetch({String message}) {
    return _UnableToFetch(
      message: message,
    );
  }

// ignore: unused_element
  _InvalidData invalidData({String message}) {
    return _InvalidData(
      message: message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $CityFailure = _$CityFailureTearOff();

/// @nodoc
mixin _$CityFailure {
  String get message;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unknown(String message),
    @required Result noMatchingResults(String message),
    @required Result requestTimeOut(String message),
    @required Result unableToFetch(String message),
    @required Result invalidData(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unknown(String message),
    Result noMatchingResults(String message),
    Result requestTimeOut(String message),
    Result unableToFetch(String message),
    Result invalidData(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unknown(_Unknown value),
    @required Result noMatchingResults(_NoMatchingResults value),
    @required Result requestTimeOut(_RequestTimeout value),
    @required Result unableToFetch(_UnableToFetch value),
    @required Result invalidData(_InvalidData value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unknown(_Unknown value),
    Result noMatchingResults(_NoMatchingResults value),
    Result requestTimeOut(_RequestTimeout value),
    Result unableToFetch(_UnableToFetch value),
    Result invalidData(_InvalidData value),
    @required Result orElse(),
  });

  $CityFailureCopyWith<CityFailure> get copyWith;
}

/// @nodoc
abstract class $CityFailureCopyWith<$Res> {
  factory $CityFailureCopyWith(
          CityFailure value, $Res Function(CityFailure) then) =
      _$CityFailureCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$CityFailureCopyWithImpl<$Res> implements $CityFailureCopyWith<$Res> {
  _$CityFailureCopyWithImpl(this._value, this._then);

  final CityFailure _value;
  // ignore: unused_field
  final $Res Function(CityFailure) _then;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
abstract class _$UnknownCopyWith<$Res> implements $CityFailureCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) then) =
      __$UnknownCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$UnknownCopyWithImpl<$Res> extends _$CityFailureCopyWithImpl<$Res>
    implements _$UnknownCopyWith<$Res> {
  __$UnknownCopyWithImpl(_Unknown _value, $Res Function(_Unknown) _then)
      : super(_value, (v) => _then(v as _Unknown));

  @override
  _Unknown get _value => super._value as _Unknown;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_Unknown(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$_Unknown implements _Unknown {
  const _$_Unknown({this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'CityFailure.unknown(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Unknown &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$UnknownCopyWith<_Unknown> get copyWith =>
      __$UnknownCopyWithImpl<_Unknown>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unknown(String message),
    @required Result noMatchingResults(String message),
    @required Result requestTimeOut(String message),
    @required Result unableToFetch(String message),
    @required Result invalidData(String message),
  }) {
    assert(unknown != null);
    assert(noMatchingResults != null);
    assert(requestTimeOut != null);
    assert(unableToFetch != null);
    assert(invalidData != null);
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unknown(String message),
    Result noMatchingResults(String message),
    Result requestTimeOut(String message),
    Result unableToFetch(String message),
    Result invalidData(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unknown(_Unknown value),
    @required Result noMatchingResults(_NoMatchingResults value),
    @required Result requestTimeOut(_RequestTimeout value),
    @required Result unableToFetch(_UnableToFetch value),
    @required Result invalidData(_InvalidData value),
  }) {
    assert(unknown != null);
    assert(noMatchingResults != null);
    assert(requestTimeOut != null);
    assert(unableToFetch != null);
    assert(invalidData != null);
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unknown(_Unknown value),
    Result noMatchingResults(_NoMatchingResults value),
    Result requestTimeOut(_RequestTimeout value),
    Result unableToFetch(_UnableToFetch value),
    Result invalidData(_InvalidData value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements CityFailure {
  const factory _Unknown({String message}) = _$_Unknown;

  @override
  String get message;
  @override
  _$UnknownCopyWith<_Unknown> get copyWith;
}

/// @nodoc
abstract class _$NoMatchingResultsCopyWith<$Res>
    implements $CityFailureCopyWith<$Res> {
  factory _$NoMatchingResultsCopyWith(
          _NoMatchingResults value, $Res Function(_NoMatchingResults) then) =
      __$NoMatchingResultsCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$NoMatchingResultsCopyWithImpl<$Res>
    extends _$CityFailureCopyWithImpl<$Res>
    implements _$NoMatchingResultsCopyWith<$Res> {
  __$NoMatchingResultsCopyWithImpl(
      _NoMatchingResults _value, $Res Function(_NoMatchingResults) _then)
      : super(_value, (v) => _then(v as _NoMatchingResults));

  @override
  _NoMatchingResults get _value => super._value as _NoMatchingResults;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_NoMatchingResults(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$_NoMatchingResults implements _NoMatchingResults {
  const _$_NoMatchingResults({this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'CityFailure.noMatchingResults(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NoMatchingResults &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$NoMatchingResultsCopyWith<_NoMatchingResults> get copyWith =>
      __$NoMatchingResultsCopyWithImpl<_NoMatchingResults>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unknown(String message),
    @required Result noMatchingResults(String message),
    @required Result requestTimeOut(String message),
    @required Result unableToFetch(String message),
    @required Result invalidData(String message),
  }) {
    assert(unknown != null);
    assert(noMatchingResults != null);
    assert(requestTimeOut != null);
    assert(unableToFetch != null);
    assert(invalidData != null);
    return noMatchingResults(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unknown(String message),
    Result noMatchingResults(String message),
    Result requestTimeOut(String message),
    Result unableToFetch(String message),
    Result invalidData(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noMatchingResults != null) {
      return noMatchingResults(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unknown(_Unknown value),
    @required Result noMatchingResults(_NoMatchingResults value),
    @required Result requestTimeOut(_RequestTimeout value),
    @required Result unableToFetch(_UnableToFetch value),
    @required Result invalidData(_InvalidData value),
  }) {
    assert(unknown != null);
    assert(noMatchingResults != null);
    assert(requestTimeOut != null);
    assert(unableToFetch != null);
    assert(invalidData != null);
    return noMatchingResults(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unknown(_Unknown value),
    Result noMatchingResults(_NoMatchingResults value),
    Result requestTimeOut(_RequestTimeout value),
    Result unableToFetch(_UnableToFetch value),
    Result invalidData(_InvalidData value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noMatchingResults != null) {
      return noMatchingResults(this);
    }
    return orElse();
  }
}

abstract class _NoMatchingResults implements CityFailure {
  const factory _NoMatchingResults({String message}) = _$_NoMatchingResults;

  @override
  String get message;
  @override
  _$NoMatchingResultsCopyWith<_NoMatchingResults> get copyWith;
}

/// @nodoc
abstract class _$RequestTimeoutCopyWith<$Res>
    implements $CityFailureCopyWith<$Res> {
  factory _$RequestTimeoutCopyWith(
          _RequestTimeout value, $Res Function(_RequestTimeout) then) =
      __$RequestTimeoutCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$RequestTimeoutCopyWithImpl<$Res>
    extends _$CityFailureCopyWithImpl<$Res>
    implements _$RequestTimeoutCopyWith<$Res> {
  __$RequestTimeoutCopyWithImpl(
      _RequestTimeout _value, $Res Function(_RequestTimeout) _then)
      : super(_value, (v) => _then(v as _RequestTimeout));

  @override
  _RequestTimeout get _value => super._value as _RequestTimeout;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_RequestTimeout(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$_RequestTimeout implements _RequestTimeout {
  const _$_RequestTimeout({this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'CityFailure.requestTimeOut(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestTimeout &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$RequestTimeoutCopyWith<_RequestTimeout> get copyWith =>
      __$RequestTimeoutCopyWithImpl<_RequestTimeout>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unknown(String message),
    @required Result noMatchingResults(String message),
    @required Result requestTimeOut(String message),
    @required Result unableToFetch(String message),
    @required Result invalidData(String message),
  }) {
    assert(unknown != null);
    assert(noMatchingResults != null);
    assert(requestTimeOut != null);
    assert(unableToFetch != null);
    assert(invalidData != null);
    return requestTimeOut(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unknown(String message),
    Result noMatchingResults(String message),
    Result requestTimeOut(String message),
    Result unableToFetch(String message),
    Result invalidData(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestTimeOut != null) {
      return requestTimeOut(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unknown(_Unknown value),
    @required Result noMatchingResults(_NoMatchingResults value),
    @required Result requestTimeOut(_RequestTimeout value),
    @required Result unableToFetch(_UnableToFetch value),
    @required Result invalidData(_InvalidData value),
  }) {
    assert(unknown != null);
    assert(noMatchingResults != null);
    assert(requestTimeOut != null);
    assert(unableToFetch != null);
    assert(invalidData != null);
    return requestTimeOut(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unknown(_Unknown value),
    Result noMatchingResults(_NoMatchingResults value),
    Result requestTimeOut(_RequestTimeout value),
    Result unableToFetch(_UnableToFetch value),
    Result invalidData(_InvalidData value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestTimeOut != null) {
      return requestTimeOut(this);
    }
    return orElse();
  }
}

abstract class _RequestTimeout implements CityFailure {
  const factory _RequestTimeout({String message}) = _$_RequestTimeout;

  @override
  String get message;
  @override
  _$RequestTimeoutCopyWith<_RequestTimeout> get copyWith;
}

/// @nodoc
abstract class _$UnableToFetchCopyWith<$Res>
    implements $CityFailureCopyWith<$Res> {
  factory _$UnableToFetchCopyWith(
          _UnableToFetch value, $Res Function(_UnableToFetch) then) =
      __$UnableToFetchCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$UnableToFetchCopyWithImpl<$Res> extends _$CityFailureCopyWithImpl<$Res>
    implements _$UnableToFetchCopyWith<$Res> {
  __$UnableToFetchCopyWithImpl(
      _UnableToFetch _value, $Res Function(_UnableToFetch) _then)
      : super(_value, (v) => _then(v as _UnableToFetch));

  @override
  _UnableToFetch get _value => super._value as _UnableToFetch;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_UnableToFetch(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$_UnableToFetch implements _UnableToFetch {
  const _$_UnableToFetch({this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'CityFailure.unableToFetch(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnableToFetch &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$UnableToFetchCopyWith<_UnableToFetch> get copyWith =>
      __$UnableToFetchCopyWithImpl<_UnableToFetch>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unknown(String message),
    @required Result noMatchingResults(String message),
    @required Result requestTimeOut(String message),
    @required Result unableToFetch(String message),
    @required Result invalidData(String message),
  }) {
    assert(unknown != null);
    assert(noMatchingResults != null);
    assert(requestTimeOut != null);
    assert(unableToFetch != null);
    assert(invalidData != null);
    return unableToFetch(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unknown(String message),
    Result noMatchingResults(String message),
    Result requestTimeOut(String message),
    Result unableToFetch(String message),
    Result invalidData(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unableToFetch != null) {
      return unableToFetch(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unknown(_Unknown value),
    @required Result noMatchingResults(_NoMatchingResults value),
    @required Result requestTimeOut(_RequestTimeout value),
    @required Result unableToFetch(_UnableToFetch value),
    @required Result invalidData(_InvalidData value),
  }) {
    assert(unknown != null);
    assert(noMatchingResults != null);
    assert(requestTimeOut != null);
    assert(unableToFetch != null);
    assert(invalidData != null);
    return unableToFetch(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unknown(_Unknown value),
    Result noMatchingResults(_NoMatchingResults value),
    Result requestTimeOut(_RequestTimeout value),
    Result unableToFetch(_UnableToFetch value),
    Result invalidData(_InvalidData value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unableToFetch != null) {
      return unableToFetch(this);
    }
    return orElse();
  }
}

abstract class _UnableToFetch implements CityFailure {
  const factory _UnableToFetch({String message}) = _$_UnableToFetch;

  @override
  String get message;
  @override
  _$UnableToFetchCopyWith<_UnableToFetch> get copyWith;
}

/// @nodoc
abstract class _$InvalidDataCopyWith<$Res>
    implements $CityFailureCopyWith<$Res> {
  factory _$InvalidDataCopyWith(
          _InvalidData value, $Res Function(_InvalidData) then) =
      __$InvalidDataCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$InvalidDataCopyWithImpl<$Res> extends _$CityFailureCopyWithImpl<$Res>
    implements _$InvalidDataCopyWith<$Res> {
  __$InvalidDataCopyWithImpl(
      _InvalidData _value, $Res Function(_InvalidData) _then)
      : super(_value, (v) => _then(v as _InvalidData));

  @override
  _InvalidData get _value => super._value as _InvalidData;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_InvalidData(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$_InvalidData implements _InvalidData {
  const _$_InvalidData({this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'CityFailure.invalidData(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InvalidData &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$InvalidDataCopyWith<_InvalidData> get copyWith =>
      __$InvalidDataCopyWithImpl<_InvalidData>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unknown(String message),
    @required Result noMatchingResults(String message),
    @required Result requestTimeOut(String message),
    @required Result unableToFetch(String message),
    @required Result invalidData(String message),
  }) {
    assert(unknown != null);
    assert(noMatchingResults != null);
    assert(requestTimeOut != null);
    assert(unableToFetch != null);
    assert(invalidData != null);
    return invalidData(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unknown(String message),
    Result noMatchingResults(String message),
    Result requestTimeOut(String message),
    Result unableToFetch(String message),
    Result invalidData(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidData != null) {
      return invalidData(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unknown(_Unknown value),
    @required Result noMatchingResults(_NoMatchingResults value),
    @required Result requestTimeOut(_RequestTimeout value),
    @required Result unableToFetch(_UnableToFetch value),
    @required Result invalidData(_InvalidData value),
  }) {
    assert(unknown != null);
    assert(noMatchingResults != null);
    assert(requestTimeOut != null);
    assert(unableToFetch != null);
    assert(invalidData != null);
    return invalidData(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unknown(_Unknown value),
    Result noMatchingResults(_NoMatchingResults value),
    Result requestTimeOut(_RequestTimeout value),
    Result unableToFetch(_UnableToFetch value),
    Result invalidData(_InvalidData value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidData != null) {
      return invalidData(this);
    }
    return orElse();
  }
}

abstract class _InvalidData implements CityFailure {
  const factory _InvalidData({String message}) = _$_InvalidData;

  @override
  String get message;
  @override
  _$InvalidDataCopyWith<_InvalidData> get copyWith;
}
