// Imports the Flutter Driver API
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
//  group('Counter App', () {
//    // First, define the Finders. We can use these to locate Widgets from the
//    // test suite. Note: the Strings provided to the `byValueKey` method must
//    // be the same as the Strings we used for the Keys in step 1.
//    final counterTextFinder = find.byValueKey('counter');
//    final buttonFinder = find.byValueKey('increment');
//
//    FlutterDriver driver;
//
//    // Connect to the Flutter driver before running any tests
//    setUpAll(() async {
//      driver = await FlutterDriver.connect();
//    });
//
//    // Close the connection to the driver after the tests have completed
//    tearDownAll(() async {
//      if (driver != null) {
//        driver.close();
//      }
//    });
//
//    test('starts at 0', () async {
//      // Use the `driver.getText` method to verify the counter starts at 0.
//      expect(await driver.getText(counterTextFinder), '0');
//    });
//
//    test('increments the counter', () async {
//      // First, tap on the button
//      await driver.tap(buttonFinder);
//
//      // Then, verify the counter text has been incremented by 1
//      expect(await driver.getText(counterTextFinder), '1');
//    });
//  });

  group('Scrollable App', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed
    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('verifies the list contains a specific item', () async {
      // Create two SerializableFinders. We will use these to locate specific
      // Widgets displayed by the app. The names provided to the byValueKey
      // method correspond to the Keys we provided to our Widgets in step 1.
      final listFinder = find.byValueKey('long_list');
      final itemFinder = find.byValueKey('item_50_text');

      await driver.scrollUntilVisible(
        // Scroll through this list
        listFinder,
        // Until we find this item
        itemFinder,
        // In order to scroll down the list, we need to provide a negative
        // value to dyScroll. Ensure this value is a small enough increment to
        // scroll the item into view without potentially scrolling past it.
        //
        // If you need to scroll through horizontal lists, provide a dxScroll
        // argument instead
        dyScroll: -300.0,
      );

      // Verify the item contains the correct text
      expect(
        await driver.getText(itemFinder),
        'Item 50',
      );
    });
  });
}
