import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_gym_app_v2/src/welcome/presentation/widgets/welcome_tab_item.dart';
import 'package:my_gym_app_v2/src/welcome/presentation/widgets/welcome_tabbar.dart';

void main() {
  testWidgets('should render correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: WelcomeTabBar(isLogin: (isLoginState) {} )
      ),
    );

    expect(find.byType(WelcomeTabItem), findsNWidgets(2));
  });
}