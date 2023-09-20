import 'package:flutter/material.dart';

class WelcomeTabItem extends StatelessWidget {
  const WelcomeTabItem({super.key, required this.label, required this.isClicked});

  final String label;
  final bool isClicked;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        isClicked ? Container(
          height: 3,
          width: 35,
          color: Colors.green,
        ) : const SizedBox(),
      ],
    );
  }
}
