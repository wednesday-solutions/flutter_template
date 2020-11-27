// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'weather_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$WeatherFailureTearOff {
  const _$WeatherFailureTearOff();

// ignore: unused_element
  _Unknown unknown({String message}) {
    return _Unknown(
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
  _RequestTimeOut requestTimeOut({String message}) {
    return _RequestTimeOut(
      message: message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $WeatherFailure = _$WeatherFailureTearOff();

/// @nodoc
mixin _$WeatherFailure {
  String get message;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unknown(String message),
    @required Result unableToFetch(String message),
    @required Result requestTimeOut(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unknown(String message),
    Result unableToFetch(String message),
    Result requestTimeOut(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unknown(_Unknown value),
    @required Result unableToFetch(_UnableToFetch value),
    @required Result requestTimeOut(_RequestTimeOut value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unknown(_Unknown value),
    Result unableToFetch(_UnableToFetch value),
    Result requestTimeOut(_RequestTimeOut value),
    @required Result orElse(),
  });

  $WeatherFailureCopyWith<WeatherFailure> get copyWith;
}

/// @nodoc
abstract class $WeatherFailureCopyWith<$Res> {
  factory $WeatherFailureCopyWith(
          WeatherFailure value, $Res Function(WeatherFailure) then) =
      _$WeatherFailureCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$WeatherFailureCopyWithImpl<$Res>
    implements $WeatherFailureCopyWith<$Res> {
  _$WeatherFailureCopyWithImpl(this._value, this._then);

  final WeatherFailure _value;
  // ignore: unused_field
  final $Res Function(WeatherFailure) _then;

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
abstract class _$UnknownCopyWith<$Res>
    implements $WeatherFailureCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) then) =
      __$UnknownCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$UnknownCopyWithImpl<$Res> extends _$WeatherFailureCopyWithImpl<$Res>
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
    return 'WeatherFailure.unknown(message: $message)';
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
    @required Result unableToFetch(String message),
    @required Result requestTimeOut(String message),
  }) {
    assert(unknown != null);
    assert(unableToFetch != null);
    assert(requestTimeOut != null);
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unknown(String message),
    Result unableToFetch(String message),
    Result requestTimeOut(String message),
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
    @required Result unableToFetch(_UnableToFetch value),
    @required Result requestTimeOut(_RequestTimeOut value),
  }) {
    assert(unknown != null);
    assert(unableToFetch != null);
    assert(requestTimeOut != null);
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unknown(_Unknown value),
    Result unableToFetch(_UnableToFetch value),
    Result requestTimeOut(_RequestTimeOut value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements WeatherFailure {
  const factory _Unknown({String message}) = _$_Unknown;

  @override
  String get message;
  @override
  _$UnknownCopyWith<_Unknown> get copyWith;
}

/// @nodoc
abstract class _$UnableToFetchCopyWith<$Res>
    implements $WeatherFailureCopyWith<$Res> {
  factory _$UnableToFetchCopyWith(
          _UnableToFetch value, $Res Function(_UnableToFetch) then) =
      __$UnableToFetchCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$UnableToFetchCopyWithImpl<$Res>
    extends _$WeatherFailureCopyWithImpl<$Res>
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
    return 'WeatherFailure.unableToFetch(message: $message)';
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
    @required Result unableToFetch(String message),
    @required Result requestTimeOut(String message),
  }) {
    assert(unknown != null);
    assert(unableToFetch != null);
    assert(requestTimeOut != null);
    return unableToFetch(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unknown(String message),
    Result unableToFetch(String message),
    Result requestTimeOut(String message),
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
    @required Result unableToFetch(_UnableToFetch value),
    @required Result requestTimeOut(_RequestTimeOut value),
  }) {
    assert(unknown != null);
    assert(unableToFetch != null);
    assert(requestTimeOut != null);
    return unableToFetch(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unknown(_Unknown value),
    Result unableToFetch(_UnableToFetch value),
    Result requestTimeOut(_RequestTimeOut value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unableToFetch != null) {
      return unableToFetch(this);
    }
    return orElse();
  }
}

abstract class _UnableToFetch implements WeatherFailure {
  const factory _UnableToFetch({String message}) = _$_UnableToFetch;

  @override
  String get message;
  @override
  _$UnableToFetchCopyWith<_UnableToFetch> get copyWith;
}

/// @nodoc
abstract class _$RequestTimeOutCopyWith<$Res>
    implements $WeatherFailureCopyWith<$Res> {
  factory _$RequestTimeOutCopyWith(
          _RequestTimeOut value, $Res Function(_RequestTimeOut) then) =
      __$RequestTimeOutCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$RequestTimeOutCopyWithImpl<$Res>
    extends _$WeatherFailureCopyWithImpl<$Res>
    implements _$RequestTimeOutCopyWith<$Res> {
  __$RequestTimeOutCopyWithImpl(
      _RequestTimeOut _value, $Res Function(_RequestTimeOut) _then)
      : super(_value, (v) => _then(v as _RequestTimeOut));

  @override
  _RequestTimeOut get _value => super._value as _RequestTimeOut;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_RequestTimeOut(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$_RequestTimeOut implements _RequestTimeOut {
  const _$_RequestTimeOut({this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'WeatherFailure.requestTimeOut(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestTimeOut &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$RequestTimeOutCopyWith<_RequestTimeOut> get copyWith =>
      __$RequestTimeOutCopyWithImpl<_RequestTimeOut>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unknown(String message),
    @required Result unableToFetch(String message),
    @required Result requestTimeOut(String message),
  }) {
    assert(unknown != null);
    assert(unableToFetch != null);
    assert(requestTimeOut != null);
    return requestTimeOut(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unknown(String message),
    Result unableToFetch(String message),
    Result requestTimeOut(String message),
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
    @required Result unableToFetch(_UnableToFetch value),
    @required Result requestTimeOut(_RequestTimeOut value),
  }) {
    assert(unknown != null);
    assert(unableToFetch != null);
    assert(requestTimeOut != null);
    return requestTimeOut(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unknown(_Unknown value),
    Result unableToFetch(_UnableToFetch value),
    Result requestTimeOut(_RequestTimeOut value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestTimeOut != null) {
      return requestTimeOut(this);
    }
    return orElse();
  }
}

abstract class _RequestTimeOut implements WeatherFailure {
  const factory _RequestTimeOut({String message}) = _$_RequestTimeOut;

  @override
  String get message;
  @override
  _$RequestTimeOutCopyWith<_RequestTimeOut> get copyWith;
}
