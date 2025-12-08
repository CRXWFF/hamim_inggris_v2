import 'package:flutter/material.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';

/// Simple selectable card used in language selection.
class CardPilihan extends StatelessWidget {
  final String label;
  final String? meta;
  final String? iconAsset;
  final IconData? icon;
  final bool selected;
  final VoidCallback? onTap;

  const CardPilihan({
    super.key,
    required this.label,
    this.meta,
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
                                  width: 72,
                                  height: 72,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const SizedBox.square()),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Text(label)),
                    if (meta != null) ...[
                      const SizedBox(width: 8),
                      Text(
                        meta!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF7A7A7A),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (selected) ...[Icon(Icons.check_circle, color: background)],
            ],
          ),
        ),
      ),
    );
  }
}
