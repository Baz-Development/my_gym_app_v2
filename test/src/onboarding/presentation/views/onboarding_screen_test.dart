import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_gym_app_v2/src/onboarding/presentation/views/onboarding_screen.dart';
import 'package:my_gym_app_v2/src/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:my_gym_app_v2/src/welcome/presentation/views/welcome_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  testWidgets('should build correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OnboardingScreen(),
      ),
    );

    expect(find.byType(PageView), findsOneWidget);
    expect(find.byType(OnboardingContent), findsOneWidget);
    expect(find.text('Skip'), findsOneWidget);
    expect(find.byType(SmoothPageIndicator), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);
    expect(find.text('Done'), findsNothing);
  });

  testWidgets('should navigate to WelcomeScreen when "Done" is tapped', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OnboardingScreen(),
      ),
    );

    expect(find.text('Done'), findsNothing);

    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();

    expect(find.text('Done'), findsOneWidget);

    await tester.tap(find.text('Done'));
    await tester.pumpAndSettle();

    expect(find.byType(WelcomeScreen), findsOneWidget);
  });

  testWidgets('should navigate to last page when "Skip" is tapped', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OnboardingScreen(),
      ),
    );

    expect(find.text('Done'), findsNothing);

    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();

    expect(find.text('Done'), findsOneWidget);
  });

  testWidgets('should change pages in PageView when "Next" is tapped', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OnboardingScreen(),
      ),
    );

    expect(find.text('Meet your coach'), findsOneWidget);
    expect(find.text('start your journey'), findsOneWidget);
    expect(find.text('Skip'), findsOneWidget);
    expect(find.byType(SmoothPageIndicator), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);

    expect(find.text('Done'), findsNothing);
    expect(find.text('Create a workout plan'), findsNothing);

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    expect(find.text('Create a workout plan'), findsOneWidget);
    expect(find.text('to stay fit'), findsOneWidget);
    expect(find.text('Skip'), findsOneWidget);
    expect(find.byType(SmoothPageIndicator), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);

    expect(find.text('Done'), findsNothing);
    expect(find.text('Meet your coach'), findsNothing);

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    expect(find.text('Create a workout plan'), findsNothing);
    expect(find.text('Action is the'), findsOneWidget);
    expect(find.text('key to all success'), findsOneWidget);
    expect(find.text('Skip'), findsOneWidget);
    expect(find.byType(SmoothPageIndicator), findsOneWidget);
    expect(find.text('Done'), findsOneWidget);
    expect(find.text('Next'), findsNothing);
  });

  testWidgets('should change pages in PageView when user swipe', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OnboardingScreen(),
      ),
    );

    expect(find.text('Meet your coach'), findsOneWidget);
    expect(find.text('Create a workout plan'), findsNothing);

    await tester.drag(find.byType(PageView), const Offset(-750, 0));
    await tester.pumpAndSettle();

    expect(find.text('Meet your coach'), findsNothing);
    expect(find.text('Create a workout plan'), findsOneWidget);

    await tester.drag(find.byType(PageView), const Offset(-750, 0));
    await tester.pumpAndSettle();

    expect(find.text('Create a workout plan'), findsNothing);
    expect(find.text('Action is the'), findsOneWidget);

    await tester.drag(find.byType(PageView), const Offset(750, 0));
    await tester.pumpAndSettle();

    expect(find.text('Create a workout plan'), findsOneWidget);
    expect(find.text('Action is the'), findsNothing);
  });
}
