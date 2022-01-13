import 'package:flutter_template/presentation/entity/screen/screen.dart';

abstract class BaseNavigator {
  void to(Screen screen);
  void back();
}
