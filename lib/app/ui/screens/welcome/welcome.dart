import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';
import 'package:hamim_inggris_v2/app/routes/routes.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/back_button.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/selanjutnya_button.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/sudah_punya_akun_button.dart';
import 'package:hamim_inggris_v2/app/ui/screens/pilih_bahasa/widgets/speech_bubble.dart';
import 'package:hamim_inggris_v2/app/ui/screens/welcome/widgets/mascot_welcome.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // top back button
              Row(
                children: [
                  AppBackButton(onPressed: () => Get.back(), size: 44),
                ],
              ),

              const SizedBox(height: 100),

              // speech bubble
              Center(
                child: SpeechBubble(
                  text: 'Assalamu\'alaikum\nsahabat Al-Qur\'an!',
                ),
              ),

              const SizedBox(height: 10),

              // mascot
              const Center(child: MascotWelcome(size: 300)),

              const Spacer(),

              // action buttons
              SizedBox(
                width: double.infinity,
                child: SelanjutnyaButton(
                  onPressed: () => Get.offAllNamed(Routes.pilih),
                  height: 56,
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: SudahPunyaAkunButton(
                  onPressed: () => Get.toNamed(Routes.home),
                  height: 56,
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
