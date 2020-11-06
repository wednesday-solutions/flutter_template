import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_bloc/core/widgets/loading_widget.dart';
import 'package:flutter_template_bloc/core/widgets/simple_info_message.dart';
import 'package:flutter_template_bloc/presentation/pages/weather/bloc/weather_bloc.dart';
import 'package:flutter_template_bloc/presentation/pages/weather/widgets/weather_error.dart';
import 'package:flutter_template_bloc/presentation/pages/weather/widgets/weather_list.dart';

class WeatherData extends StatelessWidget {
  const WeatherData();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      return state.map(
        initial: (_) => const Text('Initial'),
        loading: (_) => const WidgetLoading(loadingMessage: 'Loading Weather'),
        loaded: (state) => WeatherList(weatherList: state.weatherList),
        noCitiesSelected: (_) => const SimpleInfoMessage(
          infoMessage: 'Selected Cities will appear here.',
        ),
        failure: (state) => WeatherError(failure: state.failure),
      );
    });
  }
}
