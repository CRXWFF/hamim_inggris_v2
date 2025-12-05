import 'package:flutter/material.dart';

/// Simple mascot + speech bubble used in the onboarding screens.
class MascotBubble extends StatelessWidget {
  final String text;

  const MascotBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 72,
          height: 72,
          child: Image.asset(
            'assets/gif/maskot_header.gif',
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFFF9A66)),
            ),
            child: Text(text, style: const TextStyle(fontSize: 14)),
          ),
        ),
      ],
    );
  }
}
