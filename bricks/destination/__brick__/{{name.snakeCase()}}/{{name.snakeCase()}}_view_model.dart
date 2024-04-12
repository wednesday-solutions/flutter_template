import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/base/intent/intent_handler.dart';
import 'package:flutter_template/presentation/base/view_model_provider/base_view_model.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:get_it/get_it.dart';

final {{name.camelCase()}}ViewModelProvider =
    StateNotifierProvider.autoDispose<{{name.pascalCase()}}ViewModel, {{name.pascalCase()}}ScreenState>(
        (ref) => GetIt.I.get());

abstract class {{name.pascalCase()}}ViewModel extends BaseViewModel<{{name.pascalCase()}}Screen, {{name.pascalCase()}}ScreenState>
    implements IntentHandler<{{name.pascalCase()}}ScreenIntent> {
  {{name.pascalCase()}}ViewModel(super.state);
}
