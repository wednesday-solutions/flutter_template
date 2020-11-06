// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'weather_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$WeatherEventTearOff {
  const _$WeatherEventTearOff();

// ignore: unused_element
  _WatchWeatherForAllCities watchWeatherForAllCities() {
    return const _WatchWeatherForAllCities();
  }

// ignore: unused_element
  _WeatherListLoaded weatherListLoaded(
      Either<WeatherFailure, KtList<Weather>> weatherList) {
    return _WeatherListLoaded(
      weatherList,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $WeatherEvent = _$WeatherEventTearOff();

/// @nodoc
mixin _$WeatherEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result watchWeatherForAllCities(),
    @required
        Result weatherListLoaded(
            Either<WeatherFailure, KtList<Weather>> weatherList),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result watchWeatherForAllCities(),
    Result weatherListLoaded(
        Either<WeatherFailure, KtList<Weather>> weatherList),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result watchWeatherForAllCities(_WatchWeatherForAllCities value),
    @required Result weatherListLoaded(_WeatherListLoaded value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result watchWeatherForAllCities(_WatchWeatherForAllCities value),
    Result weatherListLoaded(_WeatherListLoaded value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $WeatherEventCopyWith<$Res> {
  factory $WeatherEventCopyWith(
          WeatherEvent value, $Res Function(WeatherEvent) then) =
      _$WeatherEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$WeatherEventCopyWithImpl<$Res> implements $WeatherEventCopyWith<$Res> {
  _$WeatherEventCopyWithImpl(this._value, this._then);

  final WeatherEvent _value;
  // ignore: unused_field
  final $Res Function(WeatherEvent) _then;
}

/// @nodoc
abstract class _$WatchWeatherForAllCitiesCopyWith<$Res> {
  factory _$WatchWeatherForAllCitiesCopyWith(_WatchWeatherForAllCities value,
          $Res Function(_WatchWeatherForAllCities) then) =
      __$WatchWeatherForAllCitiesCopyWithImpl<$Res>;
}

/// @nodoc
class __$WatchWeatherForAllCitiesCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res>
    implements _$WatchWeatherForAllCitiesCopyWith<$Res> {
  __$WatchWeatherForAllCitiesCopyWithImpl(_WatchWeatherForAllCities _value,
      $Res Function(_WatchWeatherForAllCities) _then)
      : super(_value, (v) => _then(v as _WatchWeatherForAllCities));

  @override
  _WatchWeatherForAllCities get _value =>
      super._value as _WatchWeatherForAllCities;
}

/// @nodoc
class _$_WatchWeatherForAllCities implements _WatchWeatherForAllCities {
  const _$_WatchWeatherForAllCities();

  @override
  String toString() {
    return 'WeatherEvent.watchWeatherForAllCities()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _WatchWeatherForAllCities);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result watchWeatherForAllCities(),
    @required
        Result weatherListLoaded(
            Either<WeatherFailure, KtList<Weather>> weatherList),
  }) {
    assert(watchWeatherForAllCities != null);
    assert(weatherListLoaded != null);
    return watchWeatherForAllCities();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result watchWeatherForAllCities(),
    Result weatherListLoaded(
        Either<WeatherFailure, KtList<Weather>> weatherList),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (watchWeatherForAllCities != null) {
      return watchWeatherForAllCities();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result watchWeatherForAllCities(_WatchWeatherForAllCities value),
    @required Result weatherListLoaded(_WeatherListLoaded value),
  }) {
    assert(watchWeatherForAllCities != null);
    assert(weatherListLoaded != null);
    return watchWeatherForAllCities(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result watchWeatherForAllCities(_WatchWeatherForAllCities value),
    Result weatherListLoaded(_WeatherListLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (watchWeatherForAllCities != null) {
      return watchWeatherForAllCities(this);
    }
    return orElse();
  }
}

abstract class _WatchWeatherForAllCities implements WeatherEvent {
  const factory _WatchWeatherForAllCities() = _$_WatchWeatherForAllCities;
}

/// @nodoc
abstract class _$WeatherListLoadedCopyWith<$Res> {
  factory _$WeatherListLoadedCopyWith(
          _WeatherListLoaded value, $Res Function(_WeatherListLoaded) then) =
      __$WeatherListLoadedCopyWithImpl<$Res>;
  $Res call({Either<WeatherFailure, KtList<Weather>> weatherList});
}

/// @nodoc
class __$WeatherListLoadedCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res>
    implements _$WeatherListLoadedCopyWith<$Res> {
  __$WeatherListLoadedCopyWithImpl(
      _WeatherListLoaded _value, $Res Function(_WeatherListLoaded) _then)
      : super(_value, (v) => _then(v as _WeatherListLoaded));

  @override
  _WeatherListLoaded get _value => super._value as _WeatherListLoaded;

  @override
  $Res call({
    Object weatherList = freezed,
  }) {
    return _then(_WeatherListLoaded(
      weatherList == freezed
          ? _value.weatherList
          : weatherList as Either<WeatherFailure, KtList<Weather>>,
    ));
  }
}

/// @nodoc
class _$_WeatherListLoaded implements _WeatherListLoaded {
  const _$_WeatherListLoaded(this.weatherList) : assert(weatherList != null);

  @override
  final Either<WeatherFailure, KtList<Weather>> weatherList;

  @override
  String toString() {
    return 'WeatherEvent.weatherListLoaded(weatherList: $weatherList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WeatherListLoaded &&
            (identical(other.weatherList, weatherList) ||
                const DeepCollectionEquality()
                    .equals(other.weatherList, weatherList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(weatherList);

  @override
  _$WeatherListLoadedCopyWith<_WeatherListLoaded> get copyWith =>
      __$WeatherListLoadedCopyWithImpl<_WeatherListLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result watchWeatherForAllCities(),
    @required
        Result weatherListLoaded(
            Either<WeatherFailure, KtList<Weather>> weatherList),
  }) {
    assert(watchWeatherForAllCities != null);
    assert(weatherListLoaded != null);
    return weatherListLoaded(weatherList);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result watchWeatherForAllCities(),
    Result weatherListLoaded(
        Either<WeatherFailure, KtList<Weather>> weatherList),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (weatherListLoaded != null) {
      return weatherListLoaded(weatherList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result watchWeatherForAllCities(_WatchWeatherForAllCities value),
    @required Result weatherListLoaded(_WeatherListLoaded value),
  }) {
    assert(watchWeatherForAllCities != null);
    assert(weatherListLoaded != null);
    return weatherListLoaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result watchWeatherForAllCities(_WatchWeatherForAllCities value),
    Result weatherListLoaded(_WeatherListLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (weatherListLoaded != null) {
      return weatherListLoaded(this);
    }
    return orElse();
  }
}

abstract class _WeatherListLoaded implements WeatherEvent {
  const factory _WeatherListLoaded(
          Either<WeatherFailure, KtList<Weather>> weatherList) =
      _$_WeatherListLoaded;

  Either<WeatherFailure, KtList<Weather>> get weatherList;
  _$WeatherListLoadedCopyWith<_WeatherListLoaded> get copyWith;
}

/// @nodoc
class _$WeatherStateTearOff {
  const _$WeatherStateTearOff();

// ignore: unused_element
  Initial initial() {
    return const Initial();
  }

// ignore: unused_element
  Loading loading() {
    return const Loading();
  }

// ignore: unused_element
  Loaded loaded(KtList<Weather> weatherList) {
    return Loaded(
      weatherList,
    );
  }

// ignore: unused_element
  NoCitiesSelected noCitiesSelected() {
    return const NoCitiesSelected();
  }

// ignore: unused_element
  Failure failure(WeatherFailure failure) {
    return Failure(
      failure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $WeatherState = _$WeatherStateTearOff();

/// @nodoc
mixin _$WeatherState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(KtList<Weather> weatherList),
    @required Result noCitiesSelected(),
    @required Result failure(WeatherFailure failure),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(KtList<Weather> weatherList),
    Result noCitiesSelected(),
    Result failure(WeatherFailure failure),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result loaded(Loaded value),
    @required Result noCitiesSelected(NoCitiesSelected value),
    @required Result failure(Failure value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result loaded(Loaded value),
    Result noCitiesSelected(NoCitiesSelected value),
    Result failure(Failure value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res> implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  final WeatherState _value;
  // ignore: unused_field
  final $Res Function(WeatherState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$WeatherStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc
class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'WeatherState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(KtList<Weather> weatherList),
    @required Result noCitiesSelected(),
    @required Result failure(WeatherFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(noCitiesSelected != null);
    assert(failure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(KtList<Weather> weatherList),
    Result noCitiesSelected(),
    Result failure(WeatherFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result loaded(Loaded value),
    @required Result noCitiesSelected(NoCitiesSelected value),
    @required Result failure(Failure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(noCitiesSelected != null);
    assert(failure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result loaded(Loaded value),
    Result noCitiesSelected(NoCitiesSelected value),
    Result failure(Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements WeatherState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$WeatherStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

/// @nodoc
class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'WeatherState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(KtList<Weather> weatherList),
    @required Result noCitiesSelected(),
    @required Result failure(WeatherFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(noCitiesSelected != null);
    assert(failure != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(KtList<Weather> weatherList),
    Result noCitiesSelected(),
    Result failure(WeatherFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result loaded(Loaded value),
    @required Result noCitiesSelected(NoCitiesSelected value),
    @required Result failure(Failure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(noCitiesSelected != null);
    assert(failure != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result loaded(Loaded value),
    Result noCitiesSelected(NoCitiesSelected value),
    Result failure(Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements WeatherState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $LoadedCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) then) =
      _$LoadedCopyWithImpl<$Res>;
  $Res call({KtList<Weather> weatherList});
}

/// @nodoc
class _$LoadedCopyWithImpl<$Res> extends _$WeatherStateCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(Loaded _value, $Res Function(Loaded) _then)
      : super(_value, (v) => _then(v as Loaded));

  @override
  Loaded get _value => super._value as Loaded;

  @override
  $Res call({
    Object weatherList = freezed,
  }) {
    return _then(Loaded(
      weatherList == freezed
          ? _value.weatherList
          : weatherList as KtList<Weather>,
    ));
  }
}

/// @nodoc
class _$Loaded implements Loaded {
  const _$Loaded(this.weatherList) : assert(weatherList != null);

  @override
  final KtList<Weather> weatherList;

  @override
  String toString() {
    return 'WeatherState.loaded(weatherList: $weatherList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Loaded &&
            (identical(other.weatherList, weatherList) ||
                const DeepCollectionEquality()
                    .equals(other.weatherList, weatherList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(weatherList);

  @override
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(KtList<Weather> weatherList),
    @required Result noCitiesSelected(),
    @required Result failure(WeatherFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(noCitiesSelected != null);
    assert(failure != null);
    return loaded(weatherList);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(KtList<Weather> weatherList),
    Result noCitiesSelected(),
    Result failure(WeatherFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(weatherList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result loaded(Loaded value),
    @required Result noCitiesSelected(NoCitiesSelected value),
    @required Result failure(Failure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(noCitiesSelected != null);
    assert(failure != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result loaded(Loaded value),
    Result noCitiesSelected(NoCitiesSelected value),
    Result failure(Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements WeatherState {
  const factory Loaded(KtList<Weather> weatherList) = _$Loaded;

  KtList<Weather> get weatherList;
  $LoadedCopyWith<Loaded> get copyWith;
}

/// @nodoc
abstract class $NoCitiesSelectedCopyWith<$Res> {
  factory $NoCitiesSelectedCopyWith(
          NoCitiesSelected value, $Res Function(NoCitiesSelected) then) =
      _$NoCitiesSelectedCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoCitiesSelectedCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res>
    implements $NoCitiesSelectedCopyWith<$Res> {
  _$NoCitiesSelectedCopyWithImpl(
      NoCitiesSelected _value, $Res Function(NoCitiesSelected) _then)
      : super(_value, (v) => _then(v as NoCitiesSelected));

  @override
  NoCitiesSelected get _value => super._value as NoCitiesSelected;
}

/// @nodoc
class _$NoCitiesSelected implements NoCitiesSelected {
  const _$NoCitiesSelected();

  @override
  String toString() {
    return 'WeatherState.noCitiesSelected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NoCitiesSelected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(KtList<Weather> weatherList),
    @required Result noCitiesSelected(),
    @required Result failure(WeatherFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(noCitiesSelected != null);
    assert(failure != null);
    return noCitiesSelected();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(KtList<Weather> weatherList),
    Result noCitiesSelected(),
    Result failure(WeatherFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noCitiesSelected != null) {
      return noCitiesSelected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result loaded(Loaded value),
    @required Result noCitiesSelected(NoCitiesSelected value),
    @required Result failure(Failure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(noCitiesSelected != null);
    assert(failure != null);
    return noCitiesSelected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result loaded(Loaded value),
    Result noCitiesSelected(NoCitiesSelected value),
    Result failure(Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noCitiesSelected != null) {
      return noCitiesSelected(this);
    }
    return orElse();
  }
}

abstract class NoCitiesSelected implements WeatherState {
  const factory NoCitiesSelected() = _$NoCitiesSelected;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
  $Res call({WeatherFailure failure});

  $WeatherFailureCopyWith<$Res> get failure;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> extends _$WeatherStateCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(Failure _value, $Res Function(Failure) _then)
      : super(_value, (v) => _then(v as Failure));

  @override
  Failure get _value => super._value as Failure;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(Failure(
      failure == freezed ? _value.failure : failure as WeatherFailure,
    ));
  }

  @override
  $WeatherFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $WeatherFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc
class _$Failure implements Failure {
  const _$Failure(this.failure) : assert(failure != null);

  @override
  final WeatherFailure failure;

  @override
  String toString() {
    return 'WeatherState.failure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Failure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  $FailureCopyWith<Failure> get copyWith =>
      _$FailureCopyWithImpl<Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(KtList<Weather> weatherList),
    @required Result noCitiesSelected(),
    @required Result failure(WeatherFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(noCitiesSelected != null);
    assert(failure != null);
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(KtList<Weather> weatherList),
    Result noCitiesSelected(),
    Result failure(WeatherFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result loaded(Loaded value),
    @required Result noCitiesSelected(NoCitiesSelected value),
    @required Result failure(Failure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(noCitiesSelected != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result loaded(Loaded value),
    Result noCitiesSelected(NoCitiesSelected value),
    Result failure(Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure implements WeatherState {
  const factory Failure(WeatherFailure failure) = _$Failure;

  WeatherFailure get failure;
  $FailureCopyWith<Failure> get copyWith;
}
