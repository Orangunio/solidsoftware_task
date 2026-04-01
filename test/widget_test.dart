// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solidsoftware_task/src/app.dart';

void main() {
  testWidgets(
    'App shows home page and increments tap counter',
    (WidgetTester tester) async {
      await tester.pumpWidget(const App());

    expect(find.text('Hello there'), findsOneWidget);
    expect(find.text('Taps: 0'), findsOneWidget);

    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();

    expect(find.text('Taps: 1'), findsOneWidget);
  });
}
