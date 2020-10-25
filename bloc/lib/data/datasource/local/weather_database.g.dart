// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CityDataModel extends DataClass implements Insertable<CityDataModel> {
  final int woeid;
  final String title;
  final String locationType;
  CityDataModel(
      {@required this.woeid,
      @required this.title,
      @required this.locationType});
  factory CityDataModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return CityDataModel(
      woeid: intType.mapFromDatabaseResponse(data['${effectivePrefix}woeid']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      locationType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}location_type']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || woeid != null) {
      map['woeid'] = Variable<int>(woeid);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || locationType != null) {
      map['location_type'] = Variable<String>(locationType);
    }
    return map;
  }

  CitiesCompanion toCompanion(bool nullToAbsent) {
    return CitiesCompanion(
      woeid:
          woeid == null && nullToAbsent ? const Value.absent() : Value(woeid),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      locationType: locationType == null && nullToAbsent
          ? const Value.absent()
          : Value(locationType),
    );
  }

  factory CityDataModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CityDataModel(
      woeid: serializer.fromJson<int>(json['woeid']),
      title: serializer.fromJson<String>(json['title']),
      locationType: serializer.fromJson<String>(json['locationType']),
    );
  }
  factory CityDataModel.fromJsonString(String encodedJson,
          {ValueSerializer serializer}) =>
      CityDataModel.fromJson(
          DataClass.parseJson(encodedJson) as Map<String, dynamic>,
          serializer: serializer);
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'woeid': serializer.toJson<int>(woeid),
      'title': serializer.toJson<String>(title),
      'locationType': serializer.toJson<String>(locationType),
    };
  }

  CityDataModel copyWith({int woeid, String title, String locationType}) =>
      CityDataModel(
        woeid: woeid ?? this.woeid,
        title: title ?? this.title,
        locationType: locationType ?? this.locationType,
      );
  @override
  String toString() {
    return (StringBuffer('CityDataModel(')
          ..write('woeid: $woeid, ')
          ..write('title: $title, ')
          ..write('locationType: $locationType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(woeid.hashCode, $mrjc(title.hashCode, locationType.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CityDataModel &&
          other.woeid == this.woeid &&
          other.title == this.title &&
          other.locationType == this.locationType);
}

class CitiesCompanion extends UpdateCompanion<CityDataModel> {
  final Value<int> woeid;
  final Value<String> title;
  final Value<String> locationType;
  const CitiesCompanion({
    this.woeid = const Value.absent(),
    this.title = const Value.absent(),
    this.locationType = const Value.absent(),
  });
  CitiesCompanion.insert({
    @required int woeid,
    @required String title,
    @required String locationType,
  })  : woeid = Value(woeid),
        title = Value(title),
        locationType = Value(locationType);
  static Insertable<CityDataModel> custom({
    Expression<int> woeid,
    Expression<String> title,
    Expression<String> locationType,
  }) {
    return RawValuesInsertable({
      if (woeid != null) 'woeid': woeid,
      if (title != null) 'title': title,
      if (locationType != null) 'location_type': locationType,
    });
  }

  CitiesCompanion copyWith(
      {Value<int> woeid, Value<String> title, Value<String> locationType}) {
    return CitiesCompanion(
      woeid: woeid ?? this.woeid,
      title: title ?? this.title,
      locationType: locationType ?? this.locationType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (woeid.present) {
      map['woeid'] = Variable<int>(woeid.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (locationType.present) {
      map['location_type'] = Variable<String>(locationType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CitiesCompanion(')
          ..write('woeid: $woeid, ')
          ..write('title: $title, ')
          ..write('locationType: $locationType')
          ..write(')'))
        .toString();
  }
}

class $CitiesTable extends Cities with TableInfo<$CitiesTable, CityDataModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $CitiesTable(this._db, [this._alias]);
  final VerificationMeta _woeidMeta = const VerificationMeta('woeid');
  GeneratedIntColumn _woeid;
  @override
  GeneratedIntColumn get woeid => _woeid ??= _constructWoeid();
  GeneratedIntColumn _constructWoeid() {
    return GeneratedIntColumn('woeid', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _locationTypeMeta =
      const VerificationMeta('locationType');
  GeneratedTextColumn _locationType;
  @override
  GeneratedTextColumn get locationType =>
      _locationType ??= _constructLocationType();
  GeneratedTextColumn _constructLocationType() {
    return GeneratedTextColumn(
      'location_type',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [woeid, title, locationType];
  @override
  $CitiesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cities';
  @override
  final String actualTableName = 'cities';
  @override
  VerificationContext validateIntegrity(Insertable<CityDataModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('woeid')) {
      context.handle(
          _woeidMeta, woeid.isAcceptableOrUnknown(data['woeid'], _woeidMeta));
    } else if (isInserting) {
      context.missing(_woeidMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('location_type')) {
      context.handle(
          _locationTypeMeta,
          locationType.isAcceptableOrUnknown(
              data['location_type'], _locationTypeMeta));
    } else if (isInserting) {
      context.missing(_locationTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  CityDataModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CityDataModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CitiesTable createAlias(String alias) {
    return $CitiesTable(_db, alias);
  }
}

abstract class _$WeatherDatabase extends GeneratedDatabase {
  _$WeatherDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CitiesTable _cities;
  $CitiesTable get cities => _cities ??= $CitiesTable(this);
  CityDao _cityDao;
  CityDao get cityDao => _cityDao ??= CityDao(this as WeatherDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cities];
}
