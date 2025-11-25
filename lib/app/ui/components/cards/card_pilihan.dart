import 'package:flutter/material.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';

/// Simple selectable card used in language selection.
class CardPilihan extends StatelessWidget {
  final String label;
  final String? iconAsset;
  final IconData? icon;
  final bool selected;
  final VoidCallback? onTap;

  const CardPilihan({
    super.key,
    required this.label,
    this.iconAsset,
    this.icon,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFFFFF7F0) : white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected ? background : const Color(0xFFDDDDDD),
            ),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: background.withValues(alpha: .12),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Row(
            children: [
              // flag or placeholder circle
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: white,
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFEEEEEE)),
                ),
                child: Center(
                  child: icon != null
                      ? Icon(icon, color: background, size: 20)
                      : (iconAsset != null
                            ? ClipOval(
                                child: Image.asset(
                                  iconAsset!,
                                  width: 36,
                                  height: 36,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const SizedBox.shrink()),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(label)),
              if (selected) ...[Icon(Icons.check_circle, color: background)],
            ],
          ),
        ),
      ),
    );
  }
}
