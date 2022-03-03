import 'package:mocktail/mocktail.dart';

extension WhenJustRunExt on When<Future<void>> {
  void justRun() {
    thenAnswer((_) async { return; });
  }
}

extension StreamMockExt<T> on When<Stream<T>> {
  void thenReturnEmptyStream() {
    thenAnswer((_) => Stream<T>.empty());
  }

  void thenReturnEmptyListStream() {
    thenAnswer((_) => Stream<T>.fromIterable([]));
  }
}
