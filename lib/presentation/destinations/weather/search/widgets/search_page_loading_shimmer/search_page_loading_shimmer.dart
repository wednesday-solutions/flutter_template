import 'package:flutter/material.dart';
import 'package:flutter_template/foundation/extensions/theme_ext.dart';
import 'package:shimmer/shimmer.dart';

class SearchPageLoadingShimmer extends StatelessWidget {
  const SearchPageLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: context.theme.colorScheme.surfaceVariant.withOpacity(0.2),
        highlightColor:
            context.theme.colorScheme.onSurfaceVariant.withOpacity(0.1),
        period: const Duration(seconds: 1),
        direction: ShimmerDirection.ltr,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Card(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                ),
              ),
            );
          },
          itemCount: 3,
        ),
      ),
    );
  }
}
