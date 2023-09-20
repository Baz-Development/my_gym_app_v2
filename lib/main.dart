import 'package:flutter/material.dart';
import 'package:my_gym_app_v2/src/onboarding/presentation/views/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My gym app v2',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}
