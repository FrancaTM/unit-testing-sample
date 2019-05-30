import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:unit_testing_sample/todo_list.dart';

void main() {
  testWidgets('Add and remove a todo', (WidgetTester tester) async {
    // Build the Widget
    await tester.pumpWidget(TodoList());

    // Enter 'hi' into the TextField
    await tester.enterText(find.byType(TextField), 'test');
  });
}
