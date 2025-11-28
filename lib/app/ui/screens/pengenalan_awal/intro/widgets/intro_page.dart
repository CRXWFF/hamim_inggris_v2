import 'package:flutter/material.dart';

/// Accepts a [bubble] widget (usually a `SpeechBubble`) and a [mascot] widget.
class IntroPage extends StatelessWidget {
  final Widget bubble;
  final Widget mascot;

  const IntroPage({super.key, required this.bubble, required this.mascot});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 200),
          Center(child: bubble),
          const SizedBox(height: 18),
          Center(child: mascot),
          const Spacer(),
        ],
      ),
    );
  }
}
