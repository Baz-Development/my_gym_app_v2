import 'package:flutter/material.dart';
import 'package:my_gym_app_v2/src/welcome/presentation/widgets/welcome_tab_item.dart';

class WelcomeTabBar extends StatefulWidget {
  const WelcomeTabBar({super.key, required this.isLogin});

  // 0 = login, 1 = sign up
  final Function(bool) isLogin;

  @override
  State<WelcomeTabBar> createState() => _WelcomeTabBarState();
}

class _WelcomeTabBarState extends State<WelcomeTabBar> {
  bool isOnLogin = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isOnLogin = true;
                });
                widget.isLogin(isOnLogin);
              },
              child: WelcomeTabItem(
                label: 'Login',
                isClicked: isOnLogin,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isOnLogin = false;
                });
                widget.isLogin(isOnLogin);
              },
              child: WelcomeTabItem(
                label: 'Sign up',
                isClicked: !isOnLogin,
              ),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
