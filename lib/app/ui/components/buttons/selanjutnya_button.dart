import 'package:flutter/material.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';

class SelanjutnyaButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String label;
  final double height;

  const SelanjutnyaButton({
    super.key,
    this.onPressed,
    this.label = 'SELANJUTNYA',
    this.height = 48.0,
  });

  @override
  State<SelanjutnyaButton> createState() => _SelanjutnyaButtonState();
}

class _SelanjutnyaButtonState extends State<SelanjutnyaButton> {
  bool _pressed = false;

  void _handleTapDown(TapDownDetails _) {
    setState(() => _pressed = true);
  }

  void _handleTapUp(TapUpDetails _) {
    setState(() => _pressed = false);
    widget.onPressed?.call();
  }

  void _handleTapCancel() {
    setState(() => _pressed = false);
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.onPressed != null;

    final Color topColor = const Color(0xFFF3A36E);
    final Color bottomColor = const Color(0xFFEE8251);
    final Color shadowColor = Colors.black.withValues(alpha: .25);

    // visual params that change when pressed
    final double baseShadowBottom = _pressed ? -3 : -6;
    final double translateY = _pressed ? 2.0 : 0.0;
    final Offset shadowOffset = _pressed
        ? const Offset(0, 3)
        : const Offset(0, 6);
    final double opacity = enabled ? 1.0 : 0.6;

    return Semantics(
      button: true,
      enabled: enabled,
      child: GestureDetector(
        onTapDown: enabled ? _handleTapDown : null,
        onTapUp: enabled ? _handleTapUp : null,
        onTapCancel: enabled ? _handleTapCancel : null,
        behavior: HitTestBehavior.opaque,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Back shadow / base to create the inset look from the screenshot
            Positioned(
              left: 0,
              right: 0,
              bottom: baseShadowBottom,
              child: Container(
                height: widget.height,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: .16),
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

            // Main button (moves slightly when pressed)
            AnimatedOpacity(
              duration: const Duration(milliseconds: 120),
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(0, translateY),
                child: Container(
                  height: widget.height,
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  decoration: BoxDecoration(
                    gradient: enabled
                        ? LinearGradient(
                            colors: [topColor, bottomColor],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )
                        : LinearGradient(
                            colors: [
                              Colors.grey.shade400,
                              Colors.grey.shade500,
                            ],
                          ),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor,
                        offset: shadowOffset,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      widget.label,
                      style: TextStyle(
                        color: white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0,
                      ),
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
