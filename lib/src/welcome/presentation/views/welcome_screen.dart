import 'package:flutter/material.dart';
import 'package:my_gym_app_v2/src/welcome/presentation/widgets/welcome_signup_forms.dart';
import 'package:my_gym_app_v2/src/welcome/presentation/widgets/welcome_login_forms.dart';
import 'package:my_gym_app_v2/src/welcome/presentation/widgets/welcome_tabbar.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(28, 28, 30, 1),
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  'assets/onbording/onboarding1.png',
                  height: 450,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: WelcomeTabBar(
                isLogin: (bool statusIsLogin) {
                  setState(() {
                    isLogin = statusIsLogin;
                  });
                },
              ),
            ),
            Positioned(
                left: 10,
                right: 10,
                bottom: 10,
                child: isLogin
                    ? const WelcomeLoginForms()
                    : const WelcomeSignupForms()),
          ],
        ),
      ),
    );
  }
}
