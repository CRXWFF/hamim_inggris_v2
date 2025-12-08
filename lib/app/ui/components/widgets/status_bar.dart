import 'package:flutter/material.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/back_button.dart';
// import 'package:hamim_inggris_v2/app/core/constants/color.dart';

/// A small top status bar used in onboarding screens.
/// Shows an optional back button and a progress bar beneath it.
class StatusBar extends StatelessWidget {
  final double progress; // 0.0 - 1.0
  final VoidCallback? onBack;
  final bool showBack;
  final double height;

  const StatusBar({
    super.key,
    this.progress = 0.0,
    this.onBack,
    this.showBack = true,
    this.height = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    final pct = progress.clamp(0.0, 1.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showBack) ...[
          const SizedBox(height: 12),
          AppBackButton(onPressed: onBack),
          const SizedBox(height: 12),
        ],

        // progress bar container
        Container(
          height: height,
          decoration: BoxDecoration(
            color: const Color(0xFFBEEAF3),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: pct,
              child: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: const Color(0xFF42C8D8),
                  borderRadius: BorderRadius.circular(24),
                ),
                height: height - 4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
