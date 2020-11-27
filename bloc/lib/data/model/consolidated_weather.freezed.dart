// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'consolidated_weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ConsolidatedWeather _$ConsolidatedWeatherFromJson(Map<String, dynamic> json) {
  return _ConsolidatedWeather.fromJson(json);
}

/// @nodoc
class _$ConsolidatedWeatherTearOff {
  const _$ConsolidatedWeatherTearOff();

// ignore: unused_element
  _ConsolidatedWeather call(
      int id,
      @JsonKey(name: 'weather_state_name') String weatherStateName,
      @JsonKey(name: 'weather_state_abbr') String weatherStateAbbr,
      @JsonKey(name: 'wind_direction_compass') String windDirectionCompass,
      @JsonKey(name: 'min_temp') num minTemp,
      @JsonKey(name: 'max_temp') num maxTemp,
      @JsonKey(name: 'the_temp') num theTemp,
      @JsonKey(name: 'wind_speed') num windSpeed,
      @JsonKey(name: 'wind_direction') num windDirection,
      @JsonKey(name: 'air_pressure') num airPressure,
      num humidity,
      num visibility,
      num predictability) {
    return _ConsolidatedWeather(
      id,
      weatherStateName,
      weatherStateAbbr,
      windDirectionCompass,
      minTemp,
      maxTemp,
      theTemp,
      windSpeed,
      windDirection,
      airPressure,
      humidity,
      visibility,
      predictability,
    );
  }

// ignore: unused_element
  ConsolidatedWeather fromJson(Map<String, Object> json) {
    return ConsolidatedWeather.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ConsolidatedWeather = _$ConsolidatedWeatherTearOff();

/// @nodoc
mixin _$ConsolidatedWeather {
  int get id;
  @JsonKey(name: 'weather_state_name')
  String get weatherStateName;
  @JsonKey(name: 'weather_state_abbr')
  String get weatherStateAbbr;
  @JsonKey(name: 'wind_direction_compass')
  String get windDirectionCompass;
  @JsonKey(name: 'min_temp')
  num get minTemp;
  @JsonKey(name: 'max_temp')
  num get maxTemp;
  @JsonKey(name: 'the_temp')
  num get theTemp;
  @JsonKey(name: 'wind_speed')
  num get windSpeed;
  @JsonKey(name: 'wind_direction')
  num get windDirection;
  @JsonKey(name: 'air_pressure')
  num get airPressure;
  num get humidity;
  num get visibility;
  num get predictability;

  Map<String, dynamic> toJson();
  $ConsolidatedWeatherCopyWith<ConsolidatedWeather> get copyWith;
}

/// @nodoc
abstract class $ConsolidatedWeatherCopyWith<$Res> {
  factory $ConsolidatedWeatherCopyWith(
          ConsolidatedWeather value, $Res Function(ConsolidatedWeather) then) =
      _$ConsolidatedWeatherCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'weather_state_name') String weatherStateName,
      @JsonKey(name: 'weather_state_abbr') String weatherStateAbbr,
      @JsonKey(name: 'wind_direction_compass') String windDirectionCompass,
      @JsonKey(name: 'min_temp') num minTemp,
      @JsonKey(name: 'max_temp') num maxTemp,
      @JsonKey(name: 'the_temp') num theTemp,
      @JsonKey(name: 'wind_speed') num windSpeed,
      @JsonKey(name: 'wind_direction') num windDirection,
      @JsonKey(name: 'air_pressure') num airPressure,
      num humidity,
      num visibility,
      num predictability});
}

/// @nodoc
class _$ConsolidatedWeatherCopyWithImpl<$Res>
    implements $ConsolidatedWeatherCopyWith<$Res> {
  _$ConsolidatedWeatherCopyWithImpl(this._value, this._then);

  final ConsolidatedWeather _value;
  // ignore: unused_field
  final $Res Function(ConsolidatedWeather) _then;

  @override
  $Res call({
    Object id = freezed,
    Object weatherStateName = freezed,
    Object weatherStateAbbr = freezed,
    Object windDirectionCompass = freezed,
    Object minTemp = freezed,
    Object maxTemp = freezed,
    Object theTemp = freezed,
    Object windSpeed = freezed,
    Object windDirection = freezed,
    Object airPressure = freezed,
    Object humidity = freezed,
    Object visibility = freezed,
    Object predictability = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      weatherStateName: weatherStateName == freezed
          ? _value.weatherStateName
          : weatherStateName as String,
      weatherStateAbbr: weatherStateAbbr == freezed
          ? _value.weatherStateAbbr
          : weatherStateAbbr as String,
      windDirectionCompass: windDirectionCompass == freezed
          ? _value.windDirectionCompass
          : windDirectionCompass as String,
      minTemp: minTemp == freezed ? _value.minTemp : minTemp as num,
      maxTemp: maxTemp == freezed ? _value.maxTemp : maxTemp as num,
      theTemp: theTemp == freezed ? _value.theTemp : theTemp as num,
      windSpeed: windSpeed == freezed ? _value.windSpeed : windSpeed as num,
      windDirection: windDirection == freezed
          ? _value.windDirection
          : windDirection as num,
      airPressure:
          airPressure == freezed ? _value.airPressure : airPressure as num,
      humidity: humidity == freezed ? _value.humidity : humidity as num,
      visibility: visibility == freezed ? _value.visibility : visibility as num,
      predictability: predictability == freezed
          ? _value.predictability
          : predictability as num,
    ));
  }
}

/// @nodoc
abstract class _$ConsolidatedWeatherCopyWith<$Res>
    implements $ConsolidatedWeatherCopyWith<$Res> {
  factory _$ConsolidatedWeatherCopyWith(_ConsolidatedWeather value,
          $Res Function(_ConsolidatedWeather) then) =
      __$ConsolidatedWeatherCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'weather_state_name') String weatherStateName,
      @JsonKey(name: 'weather_state_abbr') String weatherStateAbbr,
      @JsonKey(name: 'wind_direction_compass') String windDirectionCompass,
      @JsonKey(name: 'min_temp') num minTemp,
      @JsonKey(name: 'max_temp') num maxTemp,
      @JsonKey(name: 'the_temp') num theTemp,
      @JsonKey(name: 'wind_speed') num windSpeed,
      @JsonKey(name: 'wind_direction') num windDirection,
      @JsonKey(name: 'air_pressure') num airPressure,
      num humidity,
      num visibility,
      num predictability});
}

/// @nodoc
class __$ConsolidatedWeatherCopyWithImpl<$Res>
    extends _$ConsolidatedWeatherCopyWithImpl<$Res>
    implements _$ConsolidatedWeatherCopyWith<$Res> {
  __$ConsolidatedWeatherCopyWithImpl(
      _ConsolidatedWeather _value, $Res Function(_ConsolidatedWeather) _then)
      : super(_value, (v) => _then(v as _ConsolidatedWeather));

  @override
  _ConsolidatedWeather get _value => super._value as _ConsolidatedWeather;

  @override
  $Res call({
    Object id = freezed,
    Object weatherStateName = freezed,
    Object weatherStateAbbr = freezed,
    Object windDirectionCompass = freezed,
    Object minTemp = freezed,
    Object maxTemp = freezed,
    Object theTemp = freezed,
    Object windSpeed = freezed,
    Object windDirection = freezed,
    Object airPressure = freezed,
    Object humidity = freezed,
    Object visibility = freezed,
    Object predictability = freezed,
  }) {
    return _then(_ConsolidatedWeather(
      id == freezed ? _value.id : id as int,
      weatherStateName == freezed
          ? _value.weatherStateName
          : weatherStateName as String,
      weatherStateAbbr == freezed
          ? _value.weatherStateAbbr
          : weatherStateAbbr as String,
      windDirectionCompass == freezed
          ? _value.windDirectionCompass
          : windDirectionCompass as String,
      minTemp == freezed ? _value.minTemp : minTemp as num,
      maxTemp == freezed ? _value.maxTemp : maxTemp as num,
      theTemp == freezed ? _value.theTemp : theTemp as num,
      windSpeed == freezed ? _value.windSpeed : windSpeed as num,
      windDirection == freezed ? _value.windDirection : windDirection as num,
      airPressure == freezed ? _value.airPressure : airPressure as num,
      humidity == freezed ? _value.humidity : humidity as num,
      visibility == freezed ? _value.visibility : visibility as num,
      predictability == freezed ? _value.predictability : predictability as num,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ConsolidatedWeather extends _ConsolidatedWeather {
  const _$_ConsolidatedWeather(
      this.id,
      @JsonKey(name: 'weather_state_name') this.weatherStateName,
      @JsonKey(name: 'weather_state_abbr') this.weatherStateAbbr,
      @JsonKey(name: 'wind_direction_compass') this.windDirectionCompass,
      @JsonKey(name: 'min_temp') this.minTemp,
      @JsonKey(name: 'max_temp') this.maxTemp,
      @JsonKey(name: 'the_temp') this.theTemp,
      @JsonKey(name: 'wind_speed') this.windSpeed,
      @JsonKey(name: 'wind_direction') this.windDirection,
      @JsonKey(name: 'air_pressure') this.airPressure,
      this.humidity,
      this.visibility,
      this.predictability)
      : assert(id != null),
        assert(weatherStateName != null),
        assert(weatherStateAbbr != null),
        assert(windDirectionCompass != null),
        assert(minTemp != null),
        assert(maxTemp != null),
        assert(theTemp != null),
        assert(windSpeed != null),
        assert(windDirection != null),
        assert(airPressure != null),
        assert(humidity != null),
        assert(visibility != null),
        assert(predictability != null),
        super._();

  factory _$_ConsolidatedWeather.fromJson(Map<String, dynamic> json) =>
      _$_$_ConsolidatedWeatherFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'weather_state_name')
  final String weatherStateName;
  @override
  @JsonKey(name: 'weather_state_abbr')
  final String weatherStateAbbr;
  @override
  @JsonKey(name: 'wind_direction_compass')
  final String windDirectionCompass;
  @override
  @JsonKey(name: 'min_temp')
  final num minTemp;
  @override
  @JsonKey(name: 'max_temp')
  final num maxTemp;
  @override
  @JsonKey(name: 'the_temp')
  final num theTemp;
  @override
  @JsonKey(name: 'wind_speed')
  final num windSpeed;
  @override
  @JsonKey(name: 'wind_direction')
  final num windDirection;
  @override
  @JsonKey(name: 'air_pressure')
  final num airPressure;
  @override
  final num humidity;
  @override
  final num visibility;
  @override
  final num predictability;

  @override
  String toString() {
    return 'ConsolidatedWeather(id: $id, weatherStateName: $weatherStateName, weatherStateAbbr: $weatherStateAbbr, windDirectionCompass: $windDirectionCompass, minTemp: $minTemp, maxTemp: $maxTemp, theTemp: $theTemp, windSpeed: $windSpeed, windDirection: $windDirection, airPressure: $airPressure, humidity: $humidity, visibility: $visibility, predictability: $predictability)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConsolidatedWeather &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.weatherStateName, weatherStateName) ||
                const DeepCollectionEquality()
                    .equals(other.weatherStateName, weatherStateName)) &&
            (identical(other.weatherStateAbbr, weatherStateAbbr) ||
                const DeepCollectionEquality()
                    .equals(other.weatherStateAbbr, weatherStateAbbr)) &&
            (identical(other.windDirectionCompass, windDirectionCompass) ||
                const DeepCollectionEquality().equals(
                    other.windDirectionCompass, windDirectionCompass)) &&
            (identical(other.minTemp, minTemp) ||
                const DeepCollectionEquality()
                    .equals(other.minTemp, minTemp)) &&
            (identical(other.maxTemp, maxTemp) ||
                const DeepCollectionEquality()
                    .equals(other.maxTemp, maxTemp)) &&
            (identical(other.theTemp, theTemp) ||
                const DeepCollectionEquality()
                    .equals(other.theTemp, theTemp)) &&
            (identical(other.windSpeed, windSpeed) ||
                const DeepCollectionEquality()
                    .equals(other.windSpeed, windSpeed)) &&
            (identical(other.windDirection, windDirection) ||
                const DeepCollectionEquality()
                    .equals(other.windDirection, windDirection)) &&
            (identical(other.airPressure, airPressure) ||
                const DeepCollectionEquality()
                    .equals(other.airPressure, airPressure)) &&
            (identical(other.humidity, humidity) ||
                const DeepCollectionEquality()
                    .equals(other.humidity, humidity)) &&
            (identical(other.visibility, visibility) ||
                const DeepCollectionEquality()
                    .equals(other.visibility, visibility)) &&
            (identical(other.predictability, predictability) ||
                const DeepCollectionEquality()
                    .equals(other.predictability, predictability)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(weatherStateName) ^
      const DeepCollectionEquality().hash(weatherStateAbbr) ^
      const DeepCollectionEquality().hash(windDirectionCompass) ^
      const DeepCollectionEquality().hash(minTemp) ^
      const DeepCollectionEquality().hash(maxTemp) ^
      const DeepCollectionEquality().hash(theTemp) ^
      const DeepCollectionEquality().hash(windSpeed) ^
      const DeepCollectionEquality().hash(windDirection) ^
      const DeepCollectionEquality().hash(airPressure) ^
      const DeepCollectionEquality().hash(humidity) ^
      const DeepCollectionEquality().hash(visibility) ^
      const DeepCollectionEquality().hash(predictability);

  @override
  _$ConsolidatedWeatherCopyWith<_ConsolidatedWeather> get copyWith =>
      __$ConsolidatedWeatherCopyWithImpl<_ConsolidatedWeather>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ConsolidatedWeatherToJson(this);
  }
}

abstract class _ConsolidatedWeather extends ConsolidatedWeather {
  const _ConsolidatedWeather._() : super._();
  const factory _ConsolidatedWeather(
      int id,
      @JsonKey(name: 'weather_state_name') String weatherStateName,
      @JsonKey(name: 'weather_state_abbr') String weatherStateAbbr,
      @JsonKey(name: 'wind_direction_compass') String windDirectionCompass,
      @JsonKey(name: 'min_temp') num minTemp,
      @JsonKey(name: 'max_temp') num maxTemp,
      @JsonKey(name: 'the_temp') num theTemp,
      @JsonKey(name: 'wind_speed') num windSpeed,
      @JsonKey(name: 'wind_direction') num windDirection,
      @JsonKey(name: 'air_pressure') num airPressure,
      num humidity,
      num visibility,
      num predictability) = _$_ConsolidatedWeather;

  factory _ConsolidatedWeather.fromJson(Map<String, dynamic> json) =
      _$_ConsolidatedWeather.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'weather_state_name')
  String get weatherStateName;
  @override
  @JsonKey(name: 'weather_state_abbr')
  String get weatherStateAbbr;
  @override
  @JsonKey(name: 'wind_direction_compass')
  String get windDirectionCompass;
  @override
  @JsonKey(name: 'min_temp')
  num get minTemp;
  @override
  @JsonKey(name: 'max_temp')
  num get maxTemp;
  @override
  @JsonKey(name: 'the_temp')
  num get theTemp;
  @override
  @JsonKey(name: 'wind_speed')
  num get windSpeed;
  @override
  @JsonKey(name: 'wind_direction')
  num get windDirection;
  @override
  @JsonKey(name: 'air_pressure')
  num get airPressure;
  @override
  num get humidity;
  @override
  num get visibility;
  @override
  num get predictability;
  @override
  _$ConsolidatedWeatherCopyWith<_ConsolidatedWeather> get copyWith;
}
