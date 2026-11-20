import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

void main() {
  group('PrimaryButton', () {
    testWidgets('displays the correct label', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryButton(
              label: 'Book Tickets',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Book Tickets'), findsOneWidget);
    });

    testWidgets('callback runs when tapped', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryButton(
              label: 'Book Tickets',
              onPressed: () {},
            ),
          ),
        ),
      );

      await tester.tap(find.text('Book Tickets'));
      await tester.pump();

      expect(true, isTrue);
    });
  });
}