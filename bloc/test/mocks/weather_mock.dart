import 'package:flutter_template_bloc/data/model/consolidated_weather.dart';
import 'package:flutter_template_bloc/data/model/weather.dart';

const mockConsolidatedWeather1 =
    ConsolidatedWeather(1, 'abc', 'a', 'W', 12, 24, 22, 15, 2, 100, 45, 10, 2);

const mockConsolidatedWeather2 =
    ConsolidatedWeather(1, 'xyc', 'x', 'E', 22, 30, 28, 12, 4, 102, 34, 9, 9);

const mockWeather1 = Weather('Mumbai', [mockConsolidatedWeather1]);
const mockWeather2 = Weather('Pune', [mockConsolidatedWeather2]);
