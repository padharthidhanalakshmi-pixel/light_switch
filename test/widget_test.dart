import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:light_switch/main.dart';

void main() {
  testWidgets('Button turns the light on and off', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Starts OFF: grey bulb, button says ON
    expect(find.byIcon(Icons.lightbulb_outline), findsOneWidget);
    expect(find.text('ON'), findsOneWidget);

    // Press -> light ON
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    expect(find.byIcon(Icons.lightbulb), findsOneWidget);
    expect(find.text('OFF'), findsOneWidget);

    // Press again -> light OFF
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    expect(find.byIcon(Icons.lightbulb_outline), findsOneWidget);
  });
}
