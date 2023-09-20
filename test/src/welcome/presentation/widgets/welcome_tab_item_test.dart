import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_gym_app_v2/src/welcome/presentation/widgets/welcome_tab_item.dart';

void main() {
  testWidgets('should render correctly in state clicked', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: WelcomeTabItem(
          label: 'label',
          isClicked: true,
        ),
      ),
    );

    expect(find.text('label'), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(SizedBox), findsNothing);
  });

  testWidgets('should render correctly in state not clicked', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: WelcomeTabItem(
          label: 'label',
          isClicked: false,
        ),
      ),
    );

    expect(find.text('label'), findsOneWidget);
    expect(find.byType(Container), findsNothing);
    expect(find.byType(SizedBox), findsOneWidget);
  });
}
