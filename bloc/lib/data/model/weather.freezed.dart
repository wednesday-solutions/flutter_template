// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return _Weather.fromJson(json);
}

/// @nodoc
class _$WeatherTearOff {
  const _$WeatherTearOff();

// ignore: unused_element
  _Weather call(
      String title,
      @JsonKey(name: 'consolidated_weather')
          List<ConsolidatedWeather> consolidatedWeathers) {
    return _Weather(
      title,
      consolidatedWeathers,
    );
  }

// ignore: unused_element
  Weather fromJson(Map<String, Object> json) {
    return Weather.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Weather = _$WeatherTearOff();

/// @nodoc
mixin _$Weather {
  String get title;
  @JsonKey(name: 'consolidated_weather')
  List<ConsolidatedWeather> get consolidatedWeathers;

  Map<String, dynamic> toJson();
  $WeatherCopyWith<Weather> get copyWith;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res>;
  $Res call(
      {String title,
      @JsonKey(name: 'consolidated_weather')
          List<ConsolidatedWeather> consolidatedWeathers});
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res> implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  final Weather _value;
  // ignore: unused_field
  final $Res Function(Weather) _then;

  @override
  $Res call({
    Object title = freezed,
    Object consolidatedWeathers = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      consolidatedWeathers: consolidatedWeathers == freezed
          ? _value.consolidatedWeathers
          : consolidatedWeathers as List<ConsolidatedWeather>,
    ));
  }
}

/// @nodoc
abstract class _$WeatherCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$WeatherCopyWith(_Weather value, $Res Function(_Weather) then) =
      __$WeatherCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      @JsonKey(name: 'consolidated_weather')
          List<ConsolidatedWeather> consolidatedWeathers});
}

/// @nodoc
class __$WeatherCopyWithImpl<$Res> extends _$WeatherCopyWithImpl<$Res>
    implements _$WeatherCopyWith<$Res> {
  __$WeatherCopyWithImpl(_Weather _value, $Res Function(_Weather) _then)
      : super(_value, (v) => _then(v as _Weather));

  @override
  _Weather get _value => super._value as _Weather;

  @override
  $Res call({
    Object title = freezed,
    Object consolidatedWeathers = freezed,
  }) {
    return _then(_Weather(
      title == freezed ? _value.title : title as String,
      consolidatedWeathers == freezed
          ? _value.consolidatedWeathers
          : consolidatedWeathers as List<ConsolidatedWeather>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Weather implements _Weather {
  const _$_Weather(this.title,
      @JsonKey(name: 'consolidated_weather') this.consolidatedWeathers)
      : assert(title != null),
        assert(consolidatedWeathers != null);

  factory _$_Weather.fromJson(Map<String, dynamic> json) =>
      _$_$_WeatherFromJson(json);

  @override
  final String title;
  @override
  @JsonKey(name: 'consolidated_weather')
  final List<ConsolidatedWeather> consolidatedWeathers;

  @override
  String toString() {
    return 'Weather(title: $title, consolidatedWeathers: $consolidatedWeathers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Weather &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.consolidatedWeathers, consolidatedWeathers) ||
                const DeepCollectionEquality()
                    .equals(other.consolidatedWeathers, consolidatedWeathers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(consolidatedWeathers);

  @override
  _$WeatherCopyWith<_Weather> get copyWith =>
      __$WeatherCopyWithImpl<_Weather>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WeatherToJson(this);
  }
}

abstract class _Weather implements Weather {
  const factory _Weather(
      String title,
      @JsonKey(name: 'consolidated_weather')
          List<ConsolidatedWeather> consolidatedWeathers) = _$_Weather;

  factory _Weather.fromJson(Map<String, dynamic> json) = _$_Weather.fromJson;

  @override
  String get title;
  @override
  @JsonKey(name: 'consolidated_weather')
  List<ConsolidatedWeather> get consolidatedWeathers;
  @override
  _$WeatherCopyWith<_Weather> get copyWith;
}
