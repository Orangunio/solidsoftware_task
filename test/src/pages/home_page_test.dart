import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solidsoftware_task/src/pages/home_page.dart';

void main() {
  group('HomePage', () {
    testWidgets('renders  Hello there text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: HomePage()),
      );

      expect(find.text('Hello there'), findsOneWidget);
    });

    testWidgets('shows initial tap count', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: HomePage()),
      );

      expect(find.text('Taps: 0'), findsOneWidget);
    });

    testWidgets('tap counter increments on tap', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: HomePage()),
      );

      expect(find.text('Taps: 0'), findsOneWidget);

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.text('Taps: 1'), findsOneWidget);
    });
  });
}
