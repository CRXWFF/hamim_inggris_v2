import 'package:flutter/material.dart';

class MascotSiap extends StatelessWidget {
  final double size;
  const MascotSiap({super.key, this.size = 120});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(
        'assets/gif/maskot_siap_4_pertanyaan.gif',
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.android, size: 64, color: Colors.orange),
      ),
    );
  }
}
