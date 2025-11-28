// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hamim_inggris_v2/app/ui/screens/pengenalan_awal/onboarding/onboarding_screen.dart';

void main() {
  testWidgets('Onboarding screen shows title and button', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: OnboardingScreen()));

    // Verify onboarding title and button present
    expect(find.text('HAMIM'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);

    // Tap anywhere on the screen (gesture should advance onboarding)
    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();

    // After tapping, the button should not cause errors (navigation is mocked out in this test)
    expect(find.text('Get Started'), findsNothing);
  });
}
