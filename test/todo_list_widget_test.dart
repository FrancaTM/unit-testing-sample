import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:unit_testing_sample/todo_list.dart';

void main() {
  testWidgets('Add and remove a todo', (WidgetTester tester) async {
    // Build the Widget
    await tester.pumpWidget(TodoList());

    // Enter 'hi' into the TextField
    await tester.enterText(find.byType(TextField), 'test');

    // Tap the add button
    await tester.tap(find.byType(FloatingActionButton));

    // Rebuild the Widget after the state has changed
    await tester.pump();

    // Expect to find the item on screen
    expect(find.text('test'), findsOneWidget);
  });
}
