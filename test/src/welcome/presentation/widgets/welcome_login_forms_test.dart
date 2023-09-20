import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_gym_app_v2/src/home/presentation/views/home_screen.dart';
import 'package:my_gym_app_v2/src/welcome/presentation/views/welcome_forget_password_screen.dart';
import 'package:my_gym_app_v2/src/welcome/presentation/widgets/welcome_login_forms.dart';

void main() {
  testWidgets('Validate email input', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: WelcomeLoginForms(),
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField), 'invalidemail');
    await tester.pump();

    expect(find.text('Please enter a valid email'), findsOneWidget);

    await tester.enterText(
        find.byType(TextFormField), 'validemail@example.com');
    await tester.pump();

    expect(find.text('Please enter a valid email'), findsNothing);
  });

  testWidgets('Toggle password visibility', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: WelcomeLoginForms(),
        ),
      ),
    );

    expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    expect(find.byIcon(Icons.visibility), findsNothing);

    await tester.tap(find.byKey(const Key('password_toggle')));
    await tester.pump();

    expect(find.byIcon(Icons.visibility_off), findsNothing);
    expect(find.byIcon(Icons.visibility), findsOneWidget);
  });

  testWidgets('should render correctly', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: WelcomeLoginForms(),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('should navigate to forgot password screen correctly', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: WelcomeLoginForms(),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('forgot_password_button_in_login')));
    await tester.pumpAndSettle();

    expect(find.byType(WelcomeForgetPasswordScreen), findsOneWidget);
  });
}
