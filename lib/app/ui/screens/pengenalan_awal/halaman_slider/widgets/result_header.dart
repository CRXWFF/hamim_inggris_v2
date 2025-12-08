import 'package:flutter/material.dart';
import 'package:hamim_inggris_v2/app/ui/screens/pengenalan_awal/halaman_slider/widgets/mascot_bahasa.dart';

/// Header used on the results page: small mascot on the left and a speech
/// bubble-style container on the right with the provided text.
class ResultHeader extends StatelessWidget {
  final String text;

  const ResultHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 72, height: 72, child: MascotBahasa(size: 72)),
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
