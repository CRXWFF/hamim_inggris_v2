import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/selanjutnya_button.dart';
import 'package:hamim_inggris_v2/app/ui/components/widgets/speech_bubble.dart';

class ResultKuisScreen extends StatelessWidget {
  const ResultKuisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              // center speech bubble and mascot together to remove gap
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SpeechBubble(text: 'Masyallah\nTabarakallah'),
                      Image.asset(
                        'assets/gif/maskot_result.gif',
                        width: 350,
                        height: 350,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),

              // stats row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _StatBadge(icon: Icons.timer, label: '10 : 15'),
                  const SizedBox(width: 24),
                  _StatBadge(iconText: 'XP', label: '+100'),
                ],
              ),

              const SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: SizedBox(
                  width: double.infinity,
                  child: SelanjutnyaButton(
                    label: 'LANJUT HAFALAN',
                    onPressed: () => Get.offAllNamed('/home'),
                    height: 56,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final IconData? icon;
  final String? iconText;
  final String label;

  const _StatBadge({this.icon, this.iconText, required this.label});

  @override
  Widget build(BuildContext context) {
    Widget top;
    if (icon != null) {
      top = Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFFF9A66), width: 2),
          color: Colors.white,
        ),
        child: Icon(icon, color: const Color(0xFFFF9A66), size: 18),
      );
    } else if (iconText != null) {
      top = Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFFF9A66),
        ),
        child: Center(
          child: Text(
            iconText!,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ),
      );
    } else {
      top = const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        top,
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF4A4A4A),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.06),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
