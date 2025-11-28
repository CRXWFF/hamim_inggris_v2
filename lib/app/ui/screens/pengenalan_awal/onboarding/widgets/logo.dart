import 'package:flutter/material.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';

/// Small widget that shows the onboarding logo and title.
class OnboardingLogo extends StatelessWidget {
  final double iconSize;
  final String title;

  const OnboardingLogo({super.key, this.iconSize = 92, this.title = 'HAMIM'});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.menu_book_rounded, color: white, size: iconSize),
        const SizedBox(height: 12),
        Text(
          title,
          style: TextStyle(
            color: white,
            fontSize: 26,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}
