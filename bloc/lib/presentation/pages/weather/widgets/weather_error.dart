import 'package:flutter/material.dart';
import 'package:flutter_template_bloc/core/failures/weather_failure.dart';
import 'package:flutter_template_bloc/core/widgets/error_widget.dart';

class WeatherError extends StatelessWidget {
  final WeatherFailure failure;

  const WeatherError({Key key, this.failure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return failure.map(
      unknown: (value) => WidgetError(
        errorMessage: 'Unknown Failure Occured. Message: ${value.message}',
      ),
      unableToFetch: (value) => WidgetError(
        errorMessage: 'Unable to fetch weather. Message: ${value.message}',
      ),
      requestTimeOut: (value) => WidgetError(
        errorMessage: 'Request timed out. Message: ${value.message}',
      ),
    );
  }
}
