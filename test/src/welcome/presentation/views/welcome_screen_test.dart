import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_gym_app_v2/src/welcome/presentation/views/welcome_screen.dart';
import 'package:my_gym_app_v2/src/welcome/presentation/widgets/welcome_login_forms.dart';
import 'package:my_gym_app_v2/src/welcome/presentation/widgets/welcome_signup_forms.dart';
import 'package:my_gym_app_v2/src/welcome/presentation/widgets/welcome_tabbar.dart';

void main() {
  testWidgets('should render correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: WelcomeScreen(),
      ),
    );

    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(WelcomeTabBar), findsOneWidget);
    expect(find.byType(WelcomeLoginForms), findsOneWidget);
    expect(find.byType(WelcomeSignupForms), findsNothing);

    await tester.tap(find.byKey(const Key('signup_tab_button')));
    await tester.pump();

    expect(find.byType(WelcomeLoginForms), findsNothing);
    expect(find.byType(WelcomeSignupForms), findsOneWidget);
  });
}