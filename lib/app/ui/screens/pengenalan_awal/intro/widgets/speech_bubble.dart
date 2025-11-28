import 'package:flutter/material.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';

class SpeechBubble extends StatelessWidget {
  final String text;
  final TextSpan? textSpan;

  const SpeechBubble({super.key, required this.text, this.textSpan});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: background, width: 1.8),
          ),
          child: textSpan != null
              ? RichText(textAlign: TextAlign.center, text: textSpan!)
              : Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, height: 1.4),
                ),
        ),
        // little tail
        Transform.translate(
          offset: const Offset(30, 8),
          child: ClipPath(
            clipper: _BubbleTailClipper(),
            child: Container(
              width: 24,
              height: 14,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: white,
                border: Border(top: BorderSide(color: background, width: 1.8)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BubbleTailClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
