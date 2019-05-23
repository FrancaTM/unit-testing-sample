import 'package:test/test.dart';
import 'package:unit_testing_sample/counter.dart';

void main() {
  group('counter', () {
    test('value should start at zero', () {
//      final counter = Counter();
//      expect(counter.value, 0);

      expect(Counter().value, 0);
    });

    test('counter value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test('counter value should be decremented', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
