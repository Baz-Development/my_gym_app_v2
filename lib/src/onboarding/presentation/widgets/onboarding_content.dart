import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image});

  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Column(
        children: [
          Image.asset(
            image,
            height: 450,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
