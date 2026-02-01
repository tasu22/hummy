// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:hummy/theme/theme_state.dart';
import 'package:hummy/main.dart';

void main() {
  testWidgets('Theme toggling smoke test', (WidgetTester tester) async {
    // Create the theme state
    final themeState = ThemeState();

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(themeState: themeState));

    // Verify "Hello World" is displayed
    expect(find.text('Hello World'), findsOneWidget);

    // Initial state is system, so button should say "Switch to Light" (based on logic: NOT light -> switch to light)
    // Wait, let's check the logic again:
    // toggleTheme: if (light) -> dark else -> light.
    // Button text: if (light) -> "Switch to Dark" else -> "Switch to Light".
    // Initial: System. Button says "Switch to Light".
    expect(find.text('Switch to Light'), findsOneWidget);

    // Tap the button.
    await tester.tap(find.text('Switch to Light'));
    await tester.pump();

    // Logic: System -> Light.
    // Now state is Light. Button should say "Switch to Dark".
    expect(find.text('Switch to Dark'), findsOneWidget);

    // Tap again.
    await tester.tap(find.text('Switch to Dark'));
    await tester.pump();

    // Logic: Light -> Dark.
    // Now state is Dark. Button should say "Switch to Light".
    expect(find.text('Switch to Light'), findsOneWidget);
  });
}
