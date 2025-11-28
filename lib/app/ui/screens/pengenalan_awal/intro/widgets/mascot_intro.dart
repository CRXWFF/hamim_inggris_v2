import 'package:flutter/material.dart';

class MascotIntro extends StatelessWidget {
  final double size;
  const MascotIntro({super.key, this.size = 120});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(
        'assets/gif/maskot_pengenalan.gif',
        fit: BoxFit.contain,
        // If asset missing, fallback to an icon to avoid crashes in dev.
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.android, size: 64, color: Colors.orange),
      ),
    );
  }
}
