import 'package:flutter/material.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/routes/routes.dart';

/// Default appearance: white inner circle, orange border, orange chevron.
class AppBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double size;
  final double borderWidth;
  final Color? innerColor;
  final Color? borderColor;
  final Color? iconColor;

  const AppBackButton({
    super.key,
    this.onPressed,
    this.size = 44,
    this.borderWidth = 3,
    this.innerColor,
    this.borderColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color inner = innerColor ?? white;
    final Color border = borderColor ?? background;
    final Color icon = iconColor ?? background;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(size / 2),
        onTap: () {
          // debug tombol kembali
          // debugPrint('AppBackButton tapped');
          // if (onPressed != null) {
          //   onPressed!();
          //   return;
          // }

          final ctx = Get.context;
          if (ctx != null && Navigator.of(ctx).canPop()) {
            Navigator.of(ctx).maybePop();
          } else {
            // Fallback: send user to a safe landing page.
            Get.offAllNamed(Routes.home);
          }
        },
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: inner,
            shape: BoxShape.circle,
            border: Border.all(color: border, width: borderWidth),
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.chevron_left_rounded,
            color: icon,
            size: size * 0.5,
          ),
        ),
      ),
    );
  }
}
