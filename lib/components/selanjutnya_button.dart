import 'package:flutter/material.dart';

class SelanjutnyaButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double height;

  const SelanjutnyaButton({
    Key? key,
    this.onPressed,
    this.label = 'SELANJUTNYA',
    this.height = 48.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool enabled = onPressed != null;

    // Colors tuned to match the screenshot
    final Color topColor = const Color(0xFFF3A36E);
    final Color bottomColor = const Color(0xFFEE8251);
    final Color shadowColor = Colors.black.withValues(alpha: 0.25);

    return Semantics(
      button: true,
      enabled: enabled,
      child: GestureDetector(
        onTap: onPressed,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Back shadow / base to create the inset look from the screenshot
            Positioned(
              left: 0,
              right: 0,
              bottom: -6,
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: .16),
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

            // Main button
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: enabled ? 1.0 : 0.6,
              child: Container(
                height: height,
                padding: const EdgeInsets.symmetric(horizontal: 28),
                decoration: BoxDecoration(
                  gradient: enabled
                      ? LinearGradient(
                          colors: [topColor, bottomColor],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      : LinearGradient(
                          colors: [Colors.grey.shade400, Colors.grey.shade500],
                        ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      offset: const Offset(0, 6),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
