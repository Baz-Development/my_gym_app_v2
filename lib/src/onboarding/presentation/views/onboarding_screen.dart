import 'package:flutter/material.dart';
import 'package:my_gym_app_v2/src/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:my_gym_app_v2/src/welcome/presentation/views/welcome_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            controller: _pageController,
            children: const [
              OnboardingContent(
                title: 'Meet your coach',
                subtitle: 'start your journey',
                image: 'assets/onbording/onboarding1.png',
              ),
              OnboardingContent(
                title: 'Create a workout plan',
                subtitle: 'to stay fit',
                image: 'assets/onbording/onboarding2.png',
              ),
              OnboardingContent(
                title: 'Action is the',
                subtitle: 'key to all success',
                image: 'assets/onbording/onboarding3.png',
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _pageController.jumpToPage(2);
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                ),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const WelcomeScreen();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Done',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
