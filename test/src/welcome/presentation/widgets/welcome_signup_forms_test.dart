import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_gym_app_v2/src/signup/presentation/views/signup_screen.dart';
import 'package:my_gym_app_v2/src/welcome/presentation/widgets/welcome_signup_forms.dart';

void main() {
  testWidgets('Validate email input', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: WelcomeSignupForms(),
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField), 'invalidemail');
    await tester.pump();

    expect(find.text('Please enter a valid email'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'validemail@example.com');
    await tester.pump();

    expect(find.text('Please enter a valid email'), findsNothing);
  });

  testWidgets('Toggle password visibility', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: WelcomeSignupForms(),
        ),
      ),
    );

    expect(find.byIcon(Icons.visibility_off), findsNWidgets(2));
    expect(find.byIcon(Icons.visibility), findsNothing);

    await tester.tap(find.byKey(const Key('password_toggle')));
    await tester.pump();

    expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    expect(find.byIcon(Icons.visibility), findsOneWidget);

    await tester.tap(find.byKey(const Key('password_again_toggle')));
    await tester.pump();

    expect(find.byIcon(Icons.visibility_off), findsNothing);
    expect(find.byIcon(Icons.visibility), findsNWidgets(2));
  });

  testWidgets('should render correctly', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: WelcomeSignupForms(),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('signup_button')));
    await tester.pumpAndSettle();

    expect(find.byType(SignupScreen), findsOneWidget);
  });

}
