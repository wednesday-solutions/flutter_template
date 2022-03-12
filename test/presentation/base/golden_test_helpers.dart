import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

const double _goldenDiffTolerance = 0.008;

class TemplateGoldenComparator extends LocalFileComparator {
  TemplateGoldenComparator(String testFile) : super(Uri.parse(testFile));

  @override
  Future<bool> compare(Uint8List imageBytes, Uri golden) async {
    final ComparisonResult result = await GoldenFileComparator.compareLists(
      imageBytes,
      await getGoldenBytes(golden),
    );

    if (!result.passed && result.diffPercent > _goldenDiffTolerance) {
      final String error = await generateFailureOutput(result, golden, basedir);
      throw FlutterError(error);
    }
    if (!result.passed) {
      // ignore: avoid_print
      print("""
      ----------------------------------------------------------------
      A tolerable difference of ${result.diffPercent * 100}% was found 
      when comparing $golden.
      ----------------------------------------------------------------
      """);
    }
    return result.passed || result.diffPercent <= _goldenDiffTolerance;
  }
}
