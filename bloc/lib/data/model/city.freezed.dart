// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'city.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
City _$CityFromJson(Map<String, dynamic> json) {
  return _City.fromJson(json);
}

/// @nodoc
class _$CityTearOff {
  const _$CityTearOff();

// ignore: unused_element
  _City call(int woeid, String title,
      @JsonKey(name: 'location_type') String locationType,
      {bool isSelected = false}) {
    return _City(
      woeid,
      title,
      locationType,
      isSelected: isSelected,
    );
  }

// ignore: unused_element
  City fromJson(Map<String, Object> json) {
    return City.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $City = _$CityTearOff();

/// @nodoc
mixin _$City {
  int get woeid;
  String get title;
  @JsonKey(name: 'location_type')
  String get locationType;
  bool get isSelected;

  Map<String, dynamic> toJson();
  $CityCopyWith<City> get copyWith;
}

/// @nodoc
abstract class $CityCopyWith<$Res> {
  factory $CityCopyWith(City value, $Res Function(City) then) =
      _$CityCopyWithImpl<$Res>;
  $Res call(
      {int woeid,
      String title,
      @JsonKey(name: 'location_type') String locationType,
      bool isSelected});
}

/// @nodoc
class _$CityCopyWithImpl<$Res> implements $CityCopyWith<$Res> {
  _$CityCopyWithImpl(this._value, this._then);

  final City _value;
  // ignore: unused_field
  final $Res Function(City) _then;

  @override
  $Res call({
    Object woeid = freezed,
    Object title = freezed,
    Object locationType = freezed,
    Object isSelected = freezed,
  }) {
    return _then(_value.copyWith(
      woeid: woeid == freezed ? _value.woeid : woeid as int,
      title: title == freezed ? _value.title : title as String,
      locationType: locationType == freezed
          ? _value.locationType
          : locationType as String,
      isSelected:
          isSelected == freezed ? _value.isSelected : isSelected as bool,
    ));
  }
}

/// @nodoc
abstract class _$CityCopyWith<$Res> implements $CityCopyWith<$Res> {
  factory _$CityCopyWith(_City value, $Res Function(_City) then) =
      __$CityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int woeid,
      String title,
      @JsonKey(name: 'location_type') String locationType,
      bool isSelected});
}

/// @nodoc
class __$CityCopyWithImpl<$Res> extends _$CityCopyWithImpl<$Res>
    implements _$CityCopyWith<$Res> {
  __$CityCopyWithImpl(_City _value, $Res Function(_City) _then)
      : super(_value, (v) => _then(v as _City));

  @override
  _City get _value => super._value as _City;

  @override
  $Res call({
    Object woeid = freezed,
    Object title = freezed,
    Object locationType = freezed,
    Object isSelected = freezed,
  }) {
    return _then(_City(
      woeid == freezed ? _value.woeid : woeid as int,
      title == freezed ? _value.title : title as String,
      locationType == freezed ? _value.locationType : locationType as String,
      isSelected:
          isSelected == freezed ? _value.isSelected : isSelected as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_City implements _City {
  const _$_City(
      this.woeid, this.title, @JsonKey(name: 'location_type') this.locationType,
      {this.isSelected = false})
      : assert(woeid != null),
        assert(title != null),
        assert(locationType != null),
        assert(isSelected != null);

  factory _$_City.fromJson(Map<String, dynamic> json) =>
      _$_$_CityFromJson(json);

  @override
  final int woeid;
  @override
  final String title;
  @override
  @JsonKey(name: 'location_type')
  final String locationType;
  @JsonKey(defaultValue: false)
  @override
  final bool isSelected;

  @override
  String toString() {
    return 'City(woeid: $woeid, title: $title, locationType: $locationType, isSelected: $isSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _City &&
            (identical(other.woeid, woeid) ||
                const DeepCollectionEquality().equals(other.woeid, woeid)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.locationType, locationType) ||
                const DeepCollectionEquality()
                    .equals(other.locationType, locationType)) &&
            (identical(other.isSelected, isSelected) ||
                const DeepCollectionEquality()
                    .equals(other.isSelected, isSelected)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(woeid) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(locationType) ^
      const DeepCollectionEquality().hash(isSelected);

  @override
  _$CityCopyWith<_City> get copyWith =>
      __$CityCopyWithImpl<_City>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CityToJson(this);
  }
}

abstract class _City implements City {
  const factory _City(int woeid, String title,
      @JsonKey(name: 'location_type') String locationType,
      {bool isSelected}) = _$_City;

  factory _City.fromJson(Map<String, dynamic> json) = _$_City.fromJson;

  @override
  int get woeid;
  @override
  String get title;
  @override
  @JsonKey(name: 'location_type')
  String get locationType;
  @override
  bool get isSelected;
  @override
  _$CityCopyWith<_City> get copyWith;
}
