import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_bloc/core/widgets/error_widget.dart';
import 'package:flutter_template_bloc/core/widgets/loading_widget.dart';
import 'package:flutter_template_bloc/core/widgets/simple_info_message.dart';
import 'package:flutter_template_bloc/presentation/pages/cities/bloc/cities_bloc.dart';
import 'package:flutter_template_bloc/presentation/pages/cities/widgets/cities_list_data.dart';

class CitiesList extends StatelessWidget {
  const CitiesList();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CitiesBloc, CitiesState>(
        buildWhen: (previous, current) => current.maybeMap(
          selectedLoaded: (_) => false,
          selectingCity: (_) => false,
          orElse: () => true,
        ),
        builder: (context, state) {
          return state.maybeMap(
            initial: (_) => const SimpleInfoMessage(
                infoMessage: "Start typing to search..."),
            loading: (_) => const WidgetLoading(),
            loaded: (data) => CitiesListData(data.cityList),
            failure: (e) => WidgetError(errorMessage: e.failure.message),
            orElse: () => const WidgetError(
                errorMessage: 'This state should not be reached.'),
          );
        },
      ),
    );
  }
}
