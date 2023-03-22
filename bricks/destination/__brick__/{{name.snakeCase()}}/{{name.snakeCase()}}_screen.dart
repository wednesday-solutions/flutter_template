import 'package:flutter_template/presentation/entity/routes/routes.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';

class {{name.pascalCase()}}Screen extends Screen {
  const {{name.pascalCase()}}Screen() : super();

  static get path => Routes.{{name.camelCase()}};
}