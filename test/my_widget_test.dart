import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:unit_testing_sample/my_widget.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(MyWidget(title: 'T', message: 'M'));

    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets('finds a Text Widget', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Text('H'),
      ),
    ));

    expect(find.text('H'), findsOneWidget);
  });

  testWidgets('finds a Widget using a Key', (WidgetTester tester) async {
    final testKey = Key('K');

    await tester.pumpWidget(MaterialApp(key: testKey, home: Container()));

    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('finds a specific instance', (WidgetTester tester) async {
    final childWidget = Padding(padding: EdgeInsets.zero);

    await tester.pumpWidget(Container(child: childWidget));

    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
