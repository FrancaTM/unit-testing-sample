import 'package:test/test.dart';
import 'package:unit_testing_sample/counter.dart';

void main() {
  test('counter value should be incremented', () {
    final counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });
}
