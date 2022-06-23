import 'package:drift/drift.dart';

class LocalCurrentWeather extends Table {
  TextColumn get base => text()();
  IntColumn get cloudsAll => integer()();
  IntColumn get cod => integer()();
  RealColumn get coordLat => real()();
  RealColumn get coordLon => real()();
  IntColumn get dt => integer()();
  IntColumn get id => integer()();
  RealColumn get mainFeelsLike => real()();
  RealColumn get mainTemp => real()();
  RealColumn get mainTempMin => real()();
  RealColumn get mainTempMax => real()();
  IntColumn get mainHumidity => integer()();
  IntColumn get mainPressure => integer()();
  TextColumn get name => text()();
  TextColumn get sysCountry => text()();
  IntColumn get sysSunrise => integer()();
  IntColumn get sysSunset => integer()();
  IntColumn get timezone => integer()();
  IntColumn get visibility => integer()();
  IntColumn get weatherId => integer()();
  TextColumn get weatherDescription => text()();
  TextColumn get weatherIcon => text()();
  TextColumn get weatherMain => text()();
  IntColumn get windDeg => integer()();
  RealColumn get windSpeed => real()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
