import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/controller/base_controller.dart';
import 'package:flutter_template/presentation/base/controller/controller_extendsions.dart';
import 'package:flutter_template/presentation/base/widgets/observable/memoised_obx.dart';

class ScaffoldBodyWithLoadingIndicator<CONTROLLER extends BaseController>
    extends StatelessWidget {
  const ScaffoldBodyWithLoadingIndicator({
    Key? key,
    required this.body,
    this.loading,
    this.hideDefaultLoading = false,
  }) : super(key: key);

  final Widget body;
  final Widget? loading;
  final bool hideDefaultLoading;

  @override
  Widget build(BuildContext context) {
    final controller = context.controller<CONTROLLER>();
    return Center(
      child: Stack(alignment: AlignmentDirectional.center, children: [
        MemoisedObx<bool>(
          selector: (_) => controller.state.showLoading,
          child: (showLoading) {
            if (showLoading && !hideDefaultLoading)
              return loading ?? CircularProgressIndicator();

            return SizedBox();
          },
        ),
        body,
      ]),
    );
  }
}
