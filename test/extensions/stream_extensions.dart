import 'package:flutter_test/flutter_test.dart';

extension StreamEmitsInOrderExt<T> on Stream<T> {
  void inOrder(Iterable matchers) {
    expect(this, emitsInOrder(matchers));
  }

  get emitsNothing => expect(this, neverEmits(isA<Object?>()));
}
