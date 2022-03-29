import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SearchPageLoadingShimmer extends StatelessWidget {
  const SearchPageLoadingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
        highlightColor: Theme.of(context).primaryColor.withOpacity(0.2),
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
