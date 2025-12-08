import 'package:flutter/material.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';

class SudahPunyaAkunButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String label;
  final double height;
  final double borderRadius;

  const SudahPunyaAkunButton({
    super.key,
    this.onPressed,
    this.label = 'AKU SUDAH PUNYA AKUN',
    this.height = 64.0,
    this.borderRadius = 14.0,
  });

  @override
  State<SudahPunyaAkunButton> createState() => _SudahPunyaAkunButtonState();
}

class _SudahPunyaAkunButtonState extends State<SudahPunyaAkunButton> {
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

    // Visual tuning (match SelanjutnyaButton)
    final Color borderColor = Colors.grey.shade400;
    final Color shadowColor = Colors.black.withValues(alpha: .25);

    // pressed state affects translation and shadow/base offset (same as SelanjutnyaButton)
    final double translateY = _pressed ? 2.0 : 0.0;
    final double baseBottom = _pressed ? -3.0 : -6.0;
    final Offset baseOffset = _pressed
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
            // base shadow / bottom strip to create depth when unpressed (match Selanjutnya)
            Positioned(
              left: 0,
              right: 0,
              bottom: baseBottom,
              child: Container(
                height: widget.height,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: .06),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
              ),
            ),

            // main button
            AnimatedOpacity(
              duration: const Duration(milliseconds: 120),
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(0, translateY),
                child: Container(
                  height: widget.height,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    border: Border.all(color: borderColor, width: 2),
                    boxShadow: _pressed
                        ? [
                            BoxShadow(
                              color: shadowColor,
                              offset: baseOffset,
                              blurRadius: 8,
                            ),
                          ]
                        : [],
                  ),
                  child: Center(
                    child: Text(
                      widget.label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[800],
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
