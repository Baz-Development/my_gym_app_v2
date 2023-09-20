import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_gym_app_v2/src/onboarding/presentation/widgets/onboarding_content.dart';

void main() {
  testWidgets('should render correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OnboardingContent(
          title: 'Test Title',
          subtitle: 'Test Subtitle',
          image: 'assets/onbording/onboarding1.png',
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Subtitle'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);

    final titleText = find.text('Test Title');
    final subtitleText = find.text('Test Subtitle');
    expect(titleText, findsOneWidget);
    expect(subtitleText, findsOneWidget);

    final titleTextStyle = tester.widget<Text>(titleText).style;
    final subtitleTextStyle = tester.widget<Text>(subtitleText).style;

    expect(titleTextStyle?.color, equals(Colors.white));
    expect(titleTextStyle?.fontSize, equals(24.0));
    expect(titleTextStyle?.fontWeight, equals(FontWeight.w700));

    expect(subtitleTextStyle?.color, equals(Colors.white));
    expect(subtitleTextStyle?.fontSize, equals(24.0));
    expect(subtitleTextStyle?.fontWeight, equals(FontWeight.w900));
  });
}
